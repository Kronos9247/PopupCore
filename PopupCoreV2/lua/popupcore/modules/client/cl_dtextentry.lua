if CLIENT then
	net.Receive( "PopupCore_CreateTextEntry", function( len ) 
		local Owner, Player, ID = PopupCoreLib.NetReadData()
		local parentId = net.ReadFloat()
		
		local obj = vgui.Create( "DTextEntry", PopupCoreLib.GetData( "DFrame", Owner, Player, parentId ) )
		
		PopupCoreLib.SaveData( "DTextEntry", Owner, Player, ID, obj )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetPosTextEntry", "DTextEntry", function( len, obj ) 
		local Pos = PopupCoreLib.NetReadVector2D()
		
		obj:SetPos( Pos[1], Pos[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetSizeTextEntry", "DTextEntry", function( len, obj ) 
		local Size = PopupCoreLib.NetReadVector2D()
		
		obj:SetSize( Size[1], Size[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetTextTextEntry", "DTextEntry", function( len, obj ) 
		local Text = net.ReadString()
		
		obj:SetText( Text )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_RequestDataTextEntry", "DTextEntry", function( len, obj, Owner, Player, ID ) 
		PopupCoreLib.NetSend( "PopupCore_SendDataTextEntry", function()
			net.WriteEntity( Owner )
			net.WriteEntity( Player )
			net.WriteFloat( ID )
			
			net.WriteString( obj:GetValue() )
		end )
	end )
end