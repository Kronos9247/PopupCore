if CLIENT then
	net.Receive( "PopupCore_CreateButton", function( len ) 
		local Owner, Player, ID = PopupCoreLib.NetReadData()
		local parentId = net.ReadFloat()
		
		local obj = vgui.Create( "DButton", PopupCoreLib.GetData( "DFrame", Owner, Player, parentId ) )
		
		PopupCoreLib.SaveData( "DButton", Owner, Player, ID, obj )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetTitleButton", "DButton", function( len, obj ) 
		local title = net.ReadString()
		
		obj:SetText( title )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetPosButton", "DButton", function( len, obj ) 
		local Pos = PopupCoreLib.NetReadVector2D()
		
		obj:SetPos( Pos[1], Pos[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetSizeButton", "DButton", function( len, obj ) 
		local Size = PopupCoreLib.NetReadVector2D()
		
		obj:SetSize( Size[1], Size[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetEnabledButton", "DButton", function( len, obj ) 
		local enabled = net.ReadBool()
		
		obj:SetEnabled( enabled )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetImageButton", "DButton", function( len, obj ) 
		local img = net.ReadString()
		
		obj:SetImage( img )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_AddFuncButton", "DButton", function( len, obj, Owner, Player, ID ) 
		obj.DoClick = function()
			local lOwner = Owner
			local lPlayer = Player
			local lID = ID
			
			PopupCoreLib.NetSend( "PopupCore_SendClickDataButton", function()
				net.WriteEntity( lOwner )
				net.WriteEntity( lPlayer )
				net.WriteFloat( lID )
			end )
		end
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetVisibleButton", "DButton", function( len, obj ) 
		local visible = net.ReadBool()
		
		obj:SetVisible( visible ) 
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_RemoveButton", "DButton", function( len, obj ) 
		obj:Remove() 
	end )
end