PopupCore.RegisterModule( "DTree", "Kronos9247" )

PopupCore["DTree"] = {}

util.AddNetworkString( "PopupCore_CreateTree" ) 
function PopupCore.DTree.pTreeCreate( owner, id, player, parentDFrame )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_CreateTree", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteFloat( parentDFrame )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetPosTree" ) 
function PopupCore.DTree.pTreeSetPos( owner, id, player, pos )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetPosTree", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( pos )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetSizeTree" ) 
function PopupCore.DTree.pTreeSetSize( owner, id, player, size )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetSizeTree", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			PopupCoreLib.NetWriteVector2D( size )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetPaddingTree" ) 
function PopupCore.DTree.pTreeSetPadding( owner, id, player, padding )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetPaddingTree", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteFloat( padding )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SetTableTree" ) 
function PopupCore.DTree.pTreeSetTable( owner, id, player, table )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_SetTableTree", function()
			PopupCoreLib.NetWriteData( owner, player, id )
			
			net.WriteTable( table )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_AddFuncTree" ) 
function PopupCore.DTree.pTreeAddFunc( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		PopupCoreLib.NetSend( "PopupCore_AddFuncTree", function()
			PopupCoreLib.NetWriteData( owner, player, id )
		end, player )
	end
end

util.AddNetworkString( "PopupCore_SendClickDataTree" ) 
net.Receive( "PopupCore_SendClickDataTree", function( len, ply )
	local Owner = net.ReadEntity()
	local Player = net.ReadEntity()
	local ID = net.ReadFloat()
	
	local node_name = net.ReadString()
	local node_id = net.ReadFloat()
	
	if ply == Player then
		PopupCoreLib.SaveData( "DTreeClick", Owner, Player, ID, true )
		PopupCoreLib.SaveData( "DTreeName", Owner, Player, ID, node_name )
		PopupCoreLib.SaveData( "DTreeID", Owner, Player, ID, node_id )
	else
		print( PopupCoreLib.GetMessage( "UnhandledCSNetMsg" ) .. ply:SteamID() )
	end
end ) 

function PopupCore.DTree.pTreeIsPressed( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		local Bool = PopupCoreLib.GetData( "DTreeClick", owner, player, id )
		
		if Bool then
			PopupCoreLib.SaveData( "DTreeClick", owner, player, id, false )
			
			return true
		else
			return false
		end
	else
		return false
	end
end

function PopupCore.DTree.pTreeGetNodeName( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		local Name = PopupCoreLib.GetData( "DTreeName", owner, player, id )
		
		if Name then
			return Name
		else
			return ""
		end
	else
		return ""
	end
end

function PopupCore.DTree.pTreeGetNodeID( owner, id, player )
	if PopupCoreLib.hasAccess( owner, player ) then
		local Name = PopupCoreLib.GetData( "DTreeID", owner, player, id )
		
		if Name then
			return Name
		else
			return -1
		end
	else
		return -1
	end
end