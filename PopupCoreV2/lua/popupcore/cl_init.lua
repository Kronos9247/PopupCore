if CLIENT then
	PopupCore = {}
	
	include("popupcore/cl_lib.lua")
	
	print("/============= PopupCore Loader =============\\")
	print(": Loading modules/client                     :")
	print(":============================================:")
	
	local files = file.Find( "popupcore/modules/client/*.lua", "LUA" )
	for _, v in ipairs( files ) do
		print("  client/" .. v)
		include("popupcore/modules/client/" .. v)
	end
	
	print("\\============================================/")
end