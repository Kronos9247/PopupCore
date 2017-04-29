if CLIENT then
	PopupCoreLib = {}
	PopupCoreData = {}
	
	function PopupCoreLib.SaveData( Type, Owner, Player, DataName, Data )
		if not PopupCoreData[Type] then PopupCoreData[Type] = {} end
		if not PopupCoreData[Type][Player:SteamID()] then PopupCoreData[Type][Player:SteamID()] = {} end
		if not PopupCoreData[Type][Player:SteamID()][Owner:SteamID()] then PopupCoreData[Type][Player:SteamID()][Owner:SteamID()] = {} end
		PopupCoreData[Type][Player:SteamID()][Owner:SteamID()][DataName] = Data
	end
	
	function PopupCoreLib.GetData( Type, Owner, Player, DataName )
		return PopupCoreData[Type][Player:SteamID()][Owner:SteamID()][DataName]
	end
	
	function PopupCoreLib.NetReadData()
		return net.ReadEntity(), net.ReadEntity(), net.ReadFloat()
	end
	
	function PopupCoreLib.NetReadVector2D()
		local x = net.ReadFloat()
		local y = net.ReadFloat()
		
		return { x, y }
	end
	
	function PopupCoreLib.NetReceive( netmessageName, dataType, func )
		net.Receive( netmessageName, function( len ) 
			local Owner, Player, ID = PopupCoreLib.NetReadData()
			local obj = PopupCoreLib.GetData( dataType, Owner, Player, ID )
			
			func( len, obj, Owner, Player, ID )
		end )
	end
	
	function PopupCoreLib.NetSend( netmessageName, func )
		net.Start( netmessageName )
			func()
		net.SendToServer()
	end
end