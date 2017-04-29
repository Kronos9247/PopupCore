if SERVER then
	PopupCoreLib = {}
	function PopupCoreLib.NetSend( netmessageName, func, ply )
		net.Start( netmessageName )
			func()
		net.Send( ply )
	end
	
	function PopupCoreLib.hasAccess( ply, testPly )
		if PopupCore.AccessConVar:GetInt() == 1 then
			if ply:IsAdmin() then return true else return false end
		elseif PopupCore.AccessConVar:GetInt() == 2 then
			if ply:IsSuperAdmin() then return true else return false end
		else
			return true
		end
	end
	
	function PopupCoreLib.hasAccessLevel( ply, levelName )
		if levelName == "SuperAdmin" then
			if ply:IsSuperAdmin() then return true else return false end
		elseif levelName == "Admin" then
			if ply:IsAdmin() then return true else return false end
		else
			return true
		end
	end
	
	function PopupCoreLib.NetWriteData( Owner, Player, ID )
		net.WriteEntity( Owner )
		net.WriteEntity( Player )
			
		net.WriteFloat( ID )
	end
	
	function PopupCoreLib.NetWriteVector2D( vec2 )
		net.WriteFloat( vec2[1] )
		net.WriteFloat( vec2[2] )
	end
	
	function PopupCoreLib.E2BoolToBool( e2bool )
		if e2bool == 1 then return true else return false end
	end
	
	function PopupCoreLib.BoolToE2Bool( bool )
		if bool == true then return 1 else return 0 end
	end
	
	local Messages = {
		UnhandledNetMsg = "[PopupCore] Unhandled Net Message!",
		UnhandledCSNetMsg = "[PopupCore] Unhandled Net Message! From Client: "
	}
	function PopupCoreLib.GetMessage( type )
		return Messages[type]
	end
	
	PopupCoreData = {}
	function PopupCoreLib.SaveData( Type, Owner, Player, DataName, Data )
		if not PopupCoreData[Type] then PopupCoreData[Type] = {} end
		if not PopupCoreData[Type][Player:SteamID()] then PopupCoreData[Type][Player:SteamID()] = {} end
		if not PopupCoreData[Type][Player:SteamID()][Owner:SteamID()] then PopupCoreData[Type][Player:SteamID()][Owner:SteamID()] = {} end
		PopupCoreData[Type][Player:SteamID()][Owner:SteamID()][DataName] = Data
	end
	
	function PopupCoreLib.GetData( Type, Owner, Player, DataName )
		if not PopupCoreData[Type] then return end
		if not PopupCoreData[Type][Player:SteamID()] then return end
		if not PopupCoreData[Type][Player:SteamID()][Owner:SteamID()] then return end
		if not PopupCoreData[Type][Player:SteamID()][Owner:SteamID()][DataName] then return end
		return PopupCoreData[Type][Player:SteamID()][Owner:SteamID()][DataName]
	end
end