if CLIENT then
	net.Receive( "PopupCore_CreateTree", function( len ) 
		local Owner, Player, ID = PopupCoreLib.NetReadData()
		local parentId = net.ReadFloat()
		
		local obj = vgui.Create( "DTree", PopupCoreLib.GetData( "DFrame", Owner, Player, parentId ) )
		
		PopupCoreLib.SaveData( "DTree", Owner, Player, ID, obj )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetPosTree", "DTree", function( len, obj ) 
		local Pos = PopupCoreLib.NetReadVector2D()
		
		obj:SetPos( Pos[1], Pos[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetSizeTree", "DTree", function( len, obj ) 
		local Size = PopupCoreLib.NetReadVector2D()
		
		obj:SetSize( Size[1], Size[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetPaddingTree", "DTree", function( len, obj ) 
		local padding = net.ReadFloat()
		
		obj:SetPadding( padding )
	end )
	
	
	local function AddNodes( node, tabel )
		local name = tabel.name
		local licon = tabel.icon
		local lid = tabel.id
		if not name then return end
		tabel.name = nil
		tabel.icon = nil
		tabel.id = nil
		
		local lnode = node:AddNode( name )
		lnode:SetText( name )
		if licon then lnode:SetIcon(licon) end
		if lid then lnode:SetPathID( lid ) else lnode:SetPathID( -1 ) end
		
		for k, v in pairs(tabel) do
			AddNodes( lnode, v )
		end
	end
	
	local function CreateNodes( dtree, tabel ) 
		for _, v in pairs( tabel ) do
			AddNodes( dtree, v )
		end
	end
	
	PopupCoreLib.NetReceive( "PopupCore_SetTableTree", "DTree", function( len, obj ) 
		local table = net.ReadTable()
		
		CreateNodes( obj, table )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_AddFuncTree", "DTree", function( len, obj, Owner, Player, ID ) 
		function obj:OnNodeSelected( node )
			local lOwner = Owner
			local lPlayer = Player
			local lID = ID
			
			PopupCoreLib.NetSend( "PopupCore_SendClickDataTree", function()
				net.WriteEntity( lOwner )
				net.WriteEntity( lPlayer )
				net.WriteFloat( lID )
				
				net.WriteString( node:GetText() )
				net.WriteFloat( node:GetPathID() )
			end )
		end
	end )
end