if CLIENT then
	AddCSLuaFile( "cl_popup_extras.lua" )
	
end

function IsSteamFriend( ply )
	
	net.Start( "call_convar_isFriend" )
		
		net.WriteString( ply:GetFriendStatus() ) 
		net.WriteEntity( ply ) 
		
	net.SendToServer()
	
end
usermessage.Hook( "call_IsSteamFriend", IsSteamFriend, entity )