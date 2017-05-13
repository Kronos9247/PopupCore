PopupCore.RegisterModule( "DCheckBox", "Kronos9247" )

PopupCore["DCheckBox"] = {}

util.AddNetworkString( "PopupCore_CreateCheckBox" ) 
function PopupCore.DCheckBox.pCheckboxCreate( owner, id, player, parentDFrame )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_CreateCheckBox", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteFloat( parentDFrame )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetPosCheckBox" ) 
function PopupCore.DCheckBox.pCheckboxSetPos( owner, id, player, pos )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetPosCheckBox", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( pos )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetSizeCheckBox" ) 
function PopupCore.DCheckBox.pCheckboxSetSize( owner, id, player, size )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetSizeCheckBox", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( size )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetValueCheckBox" ) 
function PopupCore.DCheckBox.pCheckboxSetValue( owner, id, player, value )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetValueCheckBox", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteBool( value )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetTextCheckBox" ) 
function PopupCore.DCheckBox.pCheckboxSetText( owner, id, player, text )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetTextCheckBox", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteString( text )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SendDataCheckBox" ) 
net.Receive( "PopupCore_SendDataCheckBox", function( len, ply )
	local Owner = net.ReadEntity()
	local Player = net.ReadEntity()
	local ID = net.ReadFloat()
	
	local Value = net.ReadBool()
	
	if ply == Player then
		PopupCoreLib.SaveData( "CheckBoxValue", Owner, Player, ID, Value )
	else
		print( PopupCoreLib.GetMessage( "UnhandledCSNetMsg" ) .. ply:SteamID() )
	end
end ) 

util.AddNetworkString( "PopupCore_RequestDataCheckBox" ) 
function PopupCore.DCheckBox.pCheckboxGetValue( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_RequestDataCheckBox", function()
			PopupCoreLib.NetWriteData( owner, player, id )
		end, player )
		
		local Index = PopupCoreLib.GetData( "CheckBoxValue", owner, player, id )
		
		if Index then
			return Index
		else
			return false
		end
	else
		return false
	end
end