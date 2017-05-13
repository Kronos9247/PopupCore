PopupCore.RegisterModule( "DTextEntry", "Kronos9247" )

PopupCore["DTextEntry"] = {}

util.AddNetworkString( "PopupCore_CreateTextEntry" ) 
function PopupCore.DTextEntry.pTextEntryCreate( owner, id, player, parentDFrame )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_CreateTextEntry", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteFloat( parentDFrame )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetPosTextEntry" ) 
function PopupCore.DTextEntry.pTextEntrySetPos( owner, id, player, pos )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetPosTextEntry", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( pos )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetSizeTextEntry" ) 
function PopupCore.DTextEntry.pTextEntrySetSize( owner, id, player, size )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetSizeTextEntry", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( size )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetTextTextEntry" ) 
function PopupCore.DTextEntry.pTextEntrySetText( owner, id, player, text )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetTextTextEntry", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteString( text )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SendDataTextEntry" ) 
net.Receive( "PopupCore_SendDataTextEntry", function( len, ply )
	local Owner = net.ReadEntity()
	local Player = net.ReadEntity()
	local ID = net.ReadFloat()
	
	local Value = net.ReadString()
	
	if ply == Player then
		PopupCoreLib.SaveData( "TextEntryValue", Owner, Player, ID, Value )
	else
		print( PopupCoreLib.GetMessage( "UnhandledCSNetMsg" ) .. ply:SteamID() )
	end
end ) 

util.AddNetworkString( "PopupCore_RequestDataTextEntry" ) 
function PopupCore.DTextEntry.pTextEntryGetText( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_RequestDataTextEntry", function()
			PopupCoreLib.NetWriteData( owner, player, id )
		end, player )
		
		local Index = PopupCoreLib.GetData( "TextEntryValue", owner, player, id )
		
		if Index then
			return Index
		else
			return ""
		end
	else
		return ""
	end
end