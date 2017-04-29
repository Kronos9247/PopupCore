if CLIENT then
	net.Receive( "PopupCore_CreateHtml", function( len ) 
		local Owner, Player, ID = PopupCoreLib.NetReadData()
		local parentId = net.ReadFloat()
		
		local obj = vgui.Create( "DHTML", PopupCoreLib.GetData( "DFrame", Owner, Player, parentId ) )
		
		PopupCoreLib.SaveData( "DHtml", Owner, Player, ID, obj )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetPosHtml", "DHtml", function( len, obj ) 
		local Pos = PopupCoreLib.NetReadVector2D()
		
		obj:SetPos( Pos[1], Pos[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetSizeHtml", "DHtml", function( len, obj ) 
		local Size = PopupCoreLib.NetReadVector2D()
		
		obj:SetSize( Size[1], Size[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_DockHtml", "DHtml", function( len, obj ) 
		local dockType = net.ReadFloat()
		
		obj:Dock( dockType )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_OpenURLHtml", "DHtml", function( len, obj ) 
		local url = net.ReadString()
		
		obj:OpenURL( url )
	end )
end