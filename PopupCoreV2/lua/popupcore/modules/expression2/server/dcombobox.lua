PopupCore.RegisterModule( "DComboBox", "Kronos9247" )

PopupCore["DComboBox"] = {}

util.AddNetworkString( "PopupCore_CreateComboBox" ) 
function PopupCore.DComboBox.pComboBoxCreate( owner, id, player, parentDFrame )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_CreateComboBox", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteFloat( parentDFrame )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetPosComboBox" ) 
function PopupCore.DComboBox.pComboBoxSetPos( owner, id, player, pos )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetPosComboBox", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( pos )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetSizeComboBox" ) 
function PopupCore.DComboBox.pComboBoxSetSize( owner, id, player, size )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetSizeComboBox", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( size )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetValueComboBox" ) 
function PopupCore.DComboBox.pComboBoxSetValue( owner, id, player, value )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetValueComboBox", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteString( value )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_AddChoiceComboBox" ) 
function PopupCore.DComboBox.pComboBoxAddChoice( owner, id, player, choice, data )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_AddChoiceComboBox", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteString( choice )
			net.WriteFloat( data )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_AddFuncComboBox" ) 
function PopupCore.DComboBox.pComboBoxAddFunc( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_AddFuncComboBox", function()
			PopupCoreLib.NetWriteData( owner, player, id )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SendDataComboBox" ) 
net.Receive( "PopupCore_SendDataComboBox", function( len, ply )
	local Owner = net.ReadEntity()
	local Player = net.ReadEntity()
	local ID = net.ReadFloat()
	
	if ply == Player then
		PopupCoreLib.SaveData( "ComboBoxClick", Owner, Player, ID, true )
		PopupCoreLib.SaveData( "ComboBoxSIndex", Owner, Player, ID, net.ReadFloat() )
		PopupCoreLib.SaveData( "ComboBoxSData", Owner, Player, ID, net.ReadFloat() )
		PopupCoreLib.SaveData( "ComboBoxSValue", Owner, Player, ID, net.ReadString() )
	else
		print( PopupCoreLib.GetMessage( "UnhandledCSNetMsg" ) .. ply:SteamID() )
	end
end ) 

function PopupCore.DComboBox.pComboBoxOnSelect( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		local Bool = PopupCoreLib.GetData( "ComboBoxClick", owner, player, id )
		
		if Bool then
			PopupCoreLib.SaveData( "ComboBoxClick", owner, player, id, false )
			
			return true
		else
			return false
		end
	else
		return false
	end
end

function PopupCore.DComboBox.pComboBoxSelectedIndex( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		local Index = PopupCoreLib.GetData( "ComboBoxSIndex", owner, player, id )
		
		return Index
	else
		return 0
	end
end

function PopupCore.DComboBox.pComboBoxSelectedData( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		local Index = PopupCoreLib.GetData( "ComboBoxSData", owner, player, id )
		
		return Index
	else
		return 0
	end
end

function PopupCore.DComboBox.pComboBoxSelectedValue( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		local Index = PopupCoreLib.GetData( "ComboBoxSValue", owner, player, id )
		
		return Index
	else
		return 0
	end
end