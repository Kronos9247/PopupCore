if CLIENT then
	net.Receive( "PopupCore_CreatePopup", function( len ) 
		local Owner, Player, ID = PopupCoreLib.NetReadData()
		
		local obj = vgui.Create( "DFrame" )
		
		PopupCoreLib.SaveData( "DFrame", Owner, Player, ID, obj )
	end )
	
	net.Receive( "PopupCore_SetTitlePopup", function( len ) 
		local Owner, Player, ID = PopupCoreLib.NetReadData()
		local Title = net.ReadString()
		
		local obj = PopupCoreLib.GetData( "DFrame", Owner, Player, ID )
		obj:SetTitle( Title )
	end )
	
	net.Receive( "PopupCore_SetPosPopup", function( len ) 
		local Owner, Player, ID = PopupCoreLib.NetReadData()
		local Pos = PopupCoreLib.NetReadVector2D()
		
		local obj = PopupCoreLib.GetData( "DFrame", Owner, Player, ID )
		obj:SetPos( Pos[1], Pos[2] )
	end )
	
	net.Receive( "PopupCore_SetSizePopup", function( len ) 
		local Owner, Player, ID = PopupCoreLib.NetReadData()
		local Size = PopupCoreLib.NetReadVector2D()
		
		local obj = PopupCoreLib.GetData( "DFrame", Owner, Player, ID )
		obj:SetSize( Size[1], Size[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_MakePopup", "DFrame", function( len, obj ) 
		obj:MakePopup()
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetDraggablePopup", "DFrame", function( len, obj ) 
		local Bool = net.ReadBool()
		
		obj:SetDraggable( Bool )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_CenterPopup", "DFrame", function( len, obj ) 
		obj:Center()
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_ClosePopup", "DFrame", function( len, obj ) 
		obj:Close()
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_ShowCloseButtonPopup", "DFrame", function( len, obj ) 
		local Bool = net.ReadBool()
		
		obj:ShowCloseButton( Bool )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetSizablePopup", "DFrame", function( len, obj ) 
		local Bool = net.ReadBool()
		
		obj:SetSizable( Bool )
	end )
end