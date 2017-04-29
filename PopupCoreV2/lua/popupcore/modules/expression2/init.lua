if SERVER then
	PopupCore = {}
	
	PopupCore.AccessConVar = CreateConVar( "PopupCore_Access", "1", { FCVAR_ARCHIVE, FCVAR_NOTIFY } ) 
	
	local PopupCoreModules = {}
	function PopupCore.RegisterModule( moduleName, moduleAuthor )
		local lModule = {}
		lModule["Name"] = moduleName
		lModule["Author"] = moduleAuthor
		PopupCoreModules[moduleName] = lModule
	end
	
	include("popupcore/modules/expression2/lib.lua")
	
	print("/============= PopupCore Loader =============\\")
	print(": Loading cs modules                         :")
	print(":============================================:")
	
	local files = file.Find( "popupcore/modules/expression2/client/*.lua", "LUA" )
	for _, v in ipairs( files ) do
		print(": expression2/client/" .. v)
		AddCSLuaFile("popupcore/modules/expression2/client/" .. v)
	end
	
	print(": expression2/cl_init.lua")
	AddCSLuaFile( "cl_init.lua" )
	
	print(":============================================:")
	print(": Loading expression2/server                 :")
	print(":============================================:")
	
	local files = file.Find( "popupcore/modules/expression2/server/*.lua", "LUA" )
	for _, v in ipairs( files ) do
		print(": expression2/server/" .. v)
		include("popupcore/modules/expression2/server/" .. v)
	end
	
	--[[print(":================ Modules ===================:")
	
	for _, v in ipairs( PopupCoreModules ) do
		print("  " .. v["Name"])
	end]]--
	
	print("\\============================================/")
end