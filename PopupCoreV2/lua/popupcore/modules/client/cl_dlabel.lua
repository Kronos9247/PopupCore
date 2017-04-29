if CLIENT then
	net.Receive( "PopupCore_CreateLabel", function( len ) 
		local Owner, Player, ID = PopupCoreLib.NetReadData()
		local parentId = net.ReadFloat()
		
		local obj = vgui.Create( "DLabel", PopupCoreLib.GetData( "DFrame", Owner, Player, parentId ) )
		
		PopupCoreLib.SaveData( "DLabel", Owner, Player, ID, obj )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetPosLabel", "DLabel", function( len, obj ) 
		local Pos = PopupCoreLib.NetReadVector2D()
		
		obj:SetPos( Pos[1], Pos[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetSizeLabel", "DLabel", function( len, obj ) 
		local Size = PopupCoreLib.NetReadVector2D()
		
		obj:SetSize( Size[1], Size[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetTextLabel", "DLabel", function( len, obj ) 
		local Text = net.ReadString()
		
		obj:SetText( Text )
	end )
end