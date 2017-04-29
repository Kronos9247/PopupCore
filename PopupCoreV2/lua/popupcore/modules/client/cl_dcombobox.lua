if CLIENT then
	net.Receive( "PopupCore_CreateComboBox", function( len ) 
		local Owner, Player, ID = PopupCoreLib.NetReadData()
		local parentId = net.ReadFloat()
		
		local obj = vgui.Create( "DComboBox", PopupCoreLib.GetData( "DFrame", Owner, Player, parentId ) )
		
		PopupCoreLib.SaveData( "DComboBox", Owner, Player, ID, obj )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetPosComboBox", "DComboBox", function( len, obj ) 
		local Pos = PopupCoreLib.NetReadVector2D()
		
		obj:SetPos( Pos[1], Pos[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetSizeComboBox", "DComboBox", function( len, obj ) 
		local Size = PopupCoreLib.NetReadVector2D()
		
		obj:SetSize( Size[1], Size[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetValueComboBox", "DComboBox", function( len, obj ) 
		local Value = net.ReadString()
		
		obj:SetValue( Value )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_AddChoiceComboBox", "DComboBox", function( len, obj ) 
		local Value = net.ReadString()
		local Data = net.ReadFloat()
		
		obj:AddChoice( Value, Data )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_AddFuncComboBox", "DComboBox", function( len, obj, Owner, Player, ID ) 
		obj.OnSelect = function( panel, index, value )
			local lOwner = Owner
			local lPlayer = Player
			local lID = ID
			local lObj = obj
			
			PopupCoreLib.NetSend( "PopupCore_SendDataComboBox", function()
				net.WriteEntity( lOwner )
				net.WriteEntity( lPlayer )
				net.WriteFloat( lID )
				
				net.WriteFloat( index )
				net.WriteFloat( lObj:GetOptionData( index ) )
				net.WriteString( value )
			end )
		end
	end )
end
