if SERVER then
	PopupCore = {}
	
	print("/============= PopupCore Loader =============\\")
	print(": Loading cs modules                         :")
	print(":============================================:")
	
	local files = file.Find( "popupcore/modules/client/*.lua", "LUA" )
	for _, v in ipairs( files ) do
		print(": client/" .. v)
		AddCSLuaFile("popupcore/modules/client/" .. v)
	end
	
	print(": modules/cl_lib.lua")
	AddCSLuaFile( "cl_lib.lua" )
	
	print(": modules/cl_init.lua")
	AddCSLuaFile( "cl_init.lua" )
	
	print(":============================================:")
	print(": Loading modules/server                     :")
	print(":============================================:")
	
	local files = file.Find( "popupcore/modules/server/*.lua", "LUA" )
	for _, v in ipairs( files ) do
		print(": server/" .. v)
		include("popupcore/modules/server/" .. v)
	end
	
	print("\\============================================/")
end