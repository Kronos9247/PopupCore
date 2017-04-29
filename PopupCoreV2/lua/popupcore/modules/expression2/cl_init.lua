if CLIENT then
	PopupCore = {}
	
	print("/============= PopupCore Loader =============\\")
	print(": Loading expression2/client                 :")
	print(":============================================:")
	
	local files = file.Find( "popupcore/modules/expression2/client/*.lua", "LUA" )
	for _, v in ipairs( files ) do
		print("  expression2/client/" .. v)
		include("popupcore/modules/expression2/client/" .. v)
	end
	
	print("\\============================================/")
end