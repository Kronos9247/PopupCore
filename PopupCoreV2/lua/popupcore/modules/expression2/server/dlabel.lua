PopupCore.RegisterModule( "DLabel", "Kronos9247" )

PopupCore["DLabel"] = {}

util.AddNetworkString( "PopupCore_CreateLabel" ) 
function PopupCore.DLabel.pLabelCreate( owner, id, player, parentDFrame )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_CreateLabel", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteFloat( parentDFrame )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetPosLabel" ) 
function PopupCore.DLabel.pLabelSetPos( owner, id, player, pos )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetPosLabel", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( pos )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetSizeLabel" ) 
function PopupCore.DLabel.pLabelSetSize( owner, id, player, size )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetSizeLabel", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( size )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetTextLabel" ) 
function PopupCore.DLabel.pLabelSetText( owner, id, player, text )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetTextLabel", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteString( text )
		end, player )
	end
end