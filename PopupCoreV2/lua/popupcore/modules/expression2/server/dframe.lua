PopupCore.RegisterModule( "DFrame", "Kronos9247" )

PopupCore["DFrame"] = {}

util.AddNetworkString( "PopupCore_CreatePopup" ) 
function PopupCore.DFrame.popupCreate( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_CreatePopup", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetTitlePopup" ) 
function PopupCore.DFrame.popupSetTitle( owner, id, player, title )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetTitlePopup", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteString( title )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetPosPopup" ) 
function PopupCore.DFrame.popupSetPos( owner, id, player, pos )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetPosPopup", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( pos )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetSizePopup" ) 
function PopupCore.DFrame.popupSetSize( owner, id, player, size )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetSizePopup", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( size )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_MakePopup" ) 
function PopupCore.DFrame.popupMakePopup( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_MakePopup", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetDraggablePopup" ) 
function PopupCore.DFrame.popupSetDraggable( owner, id, player, draggable )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetDraggablePopup", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteBool( draggable )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_MakePopup" ) 
function PopupCore.DFrame.popupMakePopup( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_MakePopup", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
		end, player )
	end
end

util.AddNetworkString( "PopupCore_CenterPopup" ) 
function PopupCore.DFrame.popupCenter( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_CenterPopup", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
		end, player )
	end
end

util.AddNetworkString( "PopupCore_ClosePopup" ) 
function PopupCore.DFrame.popupClose( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_ClosePopup", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
		end, player )
	end
end

util.AddNetworkString( "PopupCore_ShowCloseButtonPopup" ) 
function PopupCore.DFrame.popupShowCloseButton( owner, id, player, showButton )
	if PopupCoreLib.hasAccess( owner, player ) then
		if PopupCoreLib.hasAccessLevel( owner, "Admin" ) then
			PopupCoreLib.NetSend( "PopupCore_ShowCloseButtonPopup", function()
				PopupCoreLib.NetWriteData( owner, player, id )
				
				net.WriteBool( showButton )
			end, player )
		end
	end
end

util.AddNetworkString( "PopupCore_SetSizablePopup" ) 
function PopupCore.DFrame.popupSetSizable( owner, id, player, sizable )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetSizablePopup", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteBool( sizable )
		end, player )
	end
end