PopupCore.RegisterModule( "DButton", "Kronos9247" )

PopupCore["DButton"] = {}

util.AddNetworkString( "PopupCore_CreateButton" ) 
function PopupCore.DButton.pbuttonCreate( owner, id, player, parentDFrame )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_CreateButton", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteFloat( parentDFrame )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetTitleButton" ) 
function PopupCore.DButton.pbuttonSetTitle( owner, id, player, title )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetTitleButton", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteString( title )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetPosButton" ) 
function PopupCore.DButton.pbuttonSetPos( owner, id, player, pos )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetPosButton", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( pos )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetSizeButton" ) 
function PopupCore.DButton.pbuttonSetSize( owner, id, player, size )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetSizeButton", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( size )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetEnabledButton" ) 
function PopupCore.DButton.pbuttonSetEnabled( owner, id, player, enabled )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetEnabledButton", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteBool( enabled )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetImageButton" ) 
function PopupCore.DButton.pbuttonSetImage( owner, id, player, img )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetImageButton", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteString( img )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_AddFuncButton" ) 
function PopupCore.DButton.pbuttonAddFunc( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_AddFuncButton", function()
			PopupCoreLib.NetWriteData( owner, player, id )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SendClickDataButton" ) 
net.Receive( "PopupCore_SendClickDataButton", function( len, ply )
	local Owner = net.ReadEntity()
	local Player = net.ReadEntity()
	local ID = net.ReadFloat()
	
	if ply == Player then
		PopupCoreLib.SaveData( "DButtonClick", Owner, Player, ID, true )
	else
		print( PopupCoreLib.GetMessage( "UnhandledCSNetMsg" ) .. ply:SteamID() )
	end
end ) 

function PopupCore.DButton.pbuttonIsPressed( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		local Bool = PopupCoreLib.GetData( "DButtonClick", owner, player, id )
		
		if Bool then
			PopupCoreLib.SaveData( "DButtonClick", owner, player, id, false )
			
			return true
		else
			return false
		end
	else
		return false
	end
end

util.AddNetworkString( "PopupCore_SetVisibleButton" ) 
function PopupCore.DButton.pbuttonSetVisible( owner, id, player, visible )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetVisibleButton", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteBool( visible )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_RemoveButton" ) 
function PopupCore.DButton.pbuttonRemove( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_RemoveButton", function()
			PopupCoreLib.NetWriteData( owner, player, id )
		end, player )
	end
end