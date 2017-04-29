PopupCore.RegisterModule( "DHTML", "Kronos9247" )

PopupCore["DHTML"] = {}

util.AddNetworkString( "PopupCore_CreateHtml" ) 
function PopupCore.DHTML.pHtmlCreate( owner, id, player, parentDFrame )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_CreateHtml", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteFloat( parentDFrame )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetPosHtml" ) 
function PopupCore.DHTML.pHtmlSetPos( owner, id, player, pos )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetPosHtml", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( pos )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetSizeHtml" ) 
function PopupCore.DHTML.pHtmlSetSize( owner, id, player, size )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetSizeHtml", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( size )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_DockHtml" ) 
function PopupCore.DHTML.pHtmlDock( owner, id, player, dockType )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_DockHtml", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteFloat( dockType )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_OpenURLHtml" ) 
function PopupCore.DHTML.pHtmlOpenURL( owner, id, player, url )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_OpenURLHtml", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteString( url )
		end, player )
	end
end