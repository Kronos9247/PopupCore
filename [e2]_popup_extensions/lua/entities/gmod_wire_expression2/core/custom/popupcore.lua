E2Lib.RegisterExtension("popupcore", false)

local sbox_E2_PopupCore = CreateConVar( "sbox_E2_PopupCore", 1, FCVAR_ARCHIVE )
local sbox_E2_PopupCore_SetToOther = CreateConVar( "sbox_E2_PopupCore_SetToOther", 2, FCVAR_ARCHIVE )

local Players = {}

--include( "cl_popup.lua" ) 
--include("client\cl_popup.lua")

if SERVER then
      AddCSLuaFile("autorun/client/cl_popup.lua")
	  AddCSLuaFile("autorun/client/cl_popup_extras.lua")
	  
	  util.AddNetworkString( "popupcore_buttonclk_click" ) 
	  util.AddNetworkString( "call_vgui_ModelPanel_getModel" )
	  util.AddNetworkString( "call_vgui_Label_getText" )
	  util.AddNetworkString( "call_vgui_Combobox_func" )
	  util.AddNetworkString( "call_convar_isFriend" )
	  
	  util.AddNetworkString( "call_vgui_convar" )
	  
else
      include("autorun/client/cl_popup.lua")
	  include("autorun/client/cl_popup_extras.lua")
	  
end

--[[local Rturn = 0
function buttonCLK( owner, uuid )
	local name = net.ReadString()
	
	if(name == owner:SteamID() .. uuid) then Rturn = 1 end
	
	Msg(owner:SteamID() .. uuid)
			
end]]--

local vgui_cvar = ""
local function setVGuiConvar( cvar )
	
	vgui_cvar = cvar
	
end

local function targetPly( ply )
	umsg.Start("call_vgui_targetPly", ply)
	umsg.Entity( ply )
	umsg.End()
	
end

local function getVGuiConvar() 
	
	net.Receive( "call_vgui_convar", function()
		
		setVGuiConvar( net.ReadString() )
		
	end )
	
	return vgui_cvar
end

local function ValidPly( ply )
	if not ply or not ply:IsValid() or not ply:IsPlayer() then
		return false
	end
	return true
end

local isFriend = 0
local function SetFriend( isFriend2 )
	isFriend=isFriend2
	
end

local function isFriend( owner, ply )
	targetPly( ply )
	umsg.Start("call_IsSteamFriend", owner)
	umsg.Entity( ply )
	umsg.End()
	
	net.Receive( "call_convar_isFriend", function()
		
		if(net.ReadString() == "friend" and net.ReadEntity() == ply) then
			SetFriend( 1 )
			
		end
		
	end )
	
end

local function isFriendOrNot( owner, ply )
	targetPly( ply )
	if(GetConVarNumber("sbox_E2_PopupCore_SetToOther") == 3) then
		if(isFriend( owner, ply ) == 1) then
			
			return true
		end
	end
	
	return false
end

local function isFriendOrNot2( owner, ply )
	targetPly( ply )
	if(GetConVarNumber("sbox_E2_PopupCore") == 1) then
		if(isFriendOrNot( owner, ply ) == 1) then
			
			return true
		end
	elseif(GetConVarNumber("sbox_E2_PopupCore") == 2) then
		if(isFriendOrNot( owner, ply ) == 1 and owner:IsAdmin()) then
			
			return true
		end
	end
end

local function hasAccess( ply, useother )
	if(ValidPly(ply) == true) then
		if(useother == false) then
			if(GetConVarNumber("sbox_E2_PopupCore") == 1) then 
				
				return true
			elseif(GetConVarNumber("sbox_E2_PopupCore") == 2) then
				if(ply:IsAdmin() == true) then
					
					return true
				end
			end
		else
			if(GetConVarNumber("sbox_E2_PopupCore_SetToOther") == 1) then 
				
				return true
			elseif(GetConVarNumber("sbox_E2_PopupCore_SetToOther") == 2) then
				if(ply:IsAdmin() == true) then
					
					return true
				end
			end
		end
	end
	
	return false
end

local function getPlayer( owner, ply ) 
	
	if(hasAccess(owner, true)) then
		
		return ply
	else
		WireLib.AddNotify( owner, "You can't target other players!", NOTIFY_GENERIC, 2 )
		owner:PrintMessage( 2, "You can't target other players!" )
		
		return owner
	end
	
	return owner
end


-------------------------------------------------------------------------------------------------------------------------------

function sendOpenHTML( ply, url )
	targetPly( ply )
	umsg.Start("call_html_vgui", ply)
	umsg.String( url )
	umsg.End()
	
end

function editButton( index, ply )
		targetPly( ply )
		umsg.Start("call_vgui_targetButton", ply)
		umsg.Float( index )
		umsg.End()
		
end

e2function void runOnPopup( number tick, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
	end
	
end

e2function void popupAddCombobox( number index, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_addComboBox", ply)
		umsg.Float( index )
		umsg.End()
		
	end
	
end

e2function void popupSetComboboxValue( number index, string title, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		editButton( index, ply )
		
		umsg.Start("call_vgui_setComboBoxValue", ply)
		umsg.String( title )
		umsg.End()
		
	end
	
end

e2function void popupSetComboboxSize( number index, number x, number y, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_setVarX", ply)
		umsg.Float( x )
		umsg.End()
		
		umsg.Start("call_vgui_setVarY", ply)
		umsg.Float( y )
		umsg.End()
	
		umsg.Start("call_vgui_setComboBoxSize", ply)
		umsg.Float( index )
		umsg.End()
		
	end
	
end

e2function void popupSetComboboxPos( number index, number x, number y, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_setVarX", ply)
		umsg.Float( x )
		umsg.End()
		
		umsg.Start("call_vgui_setVarY", ply)
		umsg.Float( y )
		umsg.End()
	
		umsg.Start("call_vgui_setComboBoxPos", ply)
		umsg.Float( index )
		umsg.End()
		
	end
	
end

e2function void popupComboboxAddFunction( number index, string uuid, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		editButton( index, ply )
	
		umsg.Start("call_vgui_funcComboBoxChoise", ply)
		umsg.String( self.player:SteamID() .. "__" .. uuid .. "__" .. index )
		umsg.End()
		
	end
	
	--self.player:SteamID() .. "_" .. uuid .. "_" .. index
	--call_vgui_Combobox_func
end

local cvvar = ""
function setcvvar( cvvar2 )
	cvvar = cvvar2
end

e2function string clkPopupCombobox( number index, string uuid, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		
		local locUUID = self.player:SteamID() .. "__" .. uuid .. "__" .. index
		
		net.Receive( "call_vgui_Combobox_func", function( len, ply )
			local UUID = net.ReadString()
			local Index = net.ReadFloat()
			local Value = net.ReadString()
			local SteamId = net.ReadString()
			
			--Msg( UUID .. " " .. Index .. " " .. Value .. "\n" )
			
			if(UUID == locUUID && SteamId == ply:SteamID()) then
				setcvvar( Value )
				
			end
			
			UUID = ""
			Index = 0
			Value = ""
			
		end )
		
	end
	
	--self.player:SteamID() .. "__" .. uuid .. "__" .. index
	--call_vgui_Combobox_func
	
	return cvvar
end

e2function void popupAddComboboxChoice( number index, string title, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		editButton( index, ply )
		
		umsg.Start("call_vgui_addComboBoxChoice", ply)
		umsg.String( title )
		umsg.End()
		
	end
	
end

e2function void popupAddLabel( number index, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_addLabel", ply)
		umsg.Float( index )
		umsg.End()
		
	end
	
end

e2function void popupSetLabelText( number index, string title, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		editButton( index, ply )
		
		umsg.Start("call_vgui_setLabelText", ply)
		umsg.String( title )
		umsg.End()
		
	end
	
end

local vgui_cvar1 = ""
local function setLabelGetTextCVar( cvar )
	
	vgui_cvar1 = cvar
	
end

e2function string popupGetLabelText( number index, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_getLabelText", ply)
		umsg.Float( index )
		umsg.End()
		
		net.Receive( "call_vgui_Label_getText", function( len, ply )
			
			local Var = net.ReadString()
			local SteamId = net.ReadString()
			
			if(SteamId == ply:SteamID()) then setLabelGetTextCVar( Var ) end
		
		end )
		
	end
	
	return vgui_cvar1
end

e2function void popupSetLabelPos( number index, number x, number y, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_setVarX", ply)
		umsg.Float( x )
		umsg.End()
		
		umsg.Start("call_vgui_setVarY", ply)
		umsg.Float( y )
		umsg.End()
	
		umsg.Start("call_vgui_setLabelPos", ply)
		umsg.Float( index )
		umsg.End()
		
	end
	
end

e2function void popupAddButtonFunction( number index, string uuid, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		editButton( index, ply )
		
		umsg.Start("call_vgui_setButtonConVar", ply)
		umsg.String( self.player:SteamID() .. "_" .. uuid .. "_" .. index )
		umsg.End()
		
	end
	
end

e2function void popupAddButtonFunction( number index, string uuid, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		editButton( index, ply )
		
		umsg.Start("call_vgui_setButtonConVar", ply)
		umsg.String( self.player:SteamID() .. "_" .. uuid .. "_" .. index )
		umsg.End()
		
	end
	
end

e2function void popupAddModelPanel( number index, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		
		umsg.Start("call_vgui_addModelPanel", ply)
		umsg.Float( index )
		umsg.End()
		
	end
	
end

e2function void popupAddModelPanelOnButton( number index, number buttonIndex, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		editButton( index, ply )
		
		umsg.Start("call_vgui_addModelPanelOnButton", ply)
		umsg.Float( buttonIndex )
		umsg.End()
		
	end
	
end

e2function void popupModelPanelSetModel( number index, string model, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		editButton( index, ply )
		
		umsg.Start("call_vgui_setModelModelPanel", ply)
		umsg.String( model )
		umsg.End()
		
	end
	
end

local model_convar = ""
function setModelConvar( cvar )
	model_convar = cvar
end

e2function string popupModelPanelGetModel( number index, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		editButton( index, ply )
		
		umsg.Start("call_vgui_getModelModelPanel", ply)
		umsg.Float( index )
		umsg.End()
		
		net.Receive( "call_vgui_ModelPanel_getModel", function( len, ply )
			
			local Var = net.ReadString()
			local SteamId = net.ReadString()
			
			if(SteamId == ply:SteamID()) then setModelConvar( Var ) end
			
		end )
		
		return model_convar
	end
	
	model_convar = ""
end

e2function void popupSetModelPanelPos( number index, number x, number y, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_setVarX", ply)
		umsg.Float( x )
		umsg.End()
		
		umsg.Start("call_vgui_setVarY", ply)
		umsg.Float( y )
		umsg.End()
		
		umsg.Start("call_vgui_setModelPanelPos", ply)
		umsg.Float( index )
		umsg.End()
		
	end
	
end

e2function void popupClose( entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		
		umsg.Start("call_vgui_closePopup", ply)
		umsg.End()
		
	end
	
end

local convar = 0
function setVariable( cvar )
	convar = cvar
end

convar = 0

e2function number clkPopupButton( number index, string uuid, entity ply ) 
	--if(hasAccess( self.player, false )) then
	targetPly( ply )
		
		--net.Receive( "popupcore_buttonclk", buttonCLK( self.player, uuid ) ) 
	net.Receive( "popupcore_buttonclk_click", function( len, ply )
		
		local Var = net.ReadString()
		local SteamId = net.ReadString()
		
		local name2 = ply:SteamID() .. "_" .. uuid .. "_" .. index
		if(Var == name2 && SteamId == ply:SteamID()) then 
			setVariable( 1 ) 
				
		end
			
	end ) 
		
	--end
	
	return convar
end

e2function void popupAddButton( number index, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_addButton", ply)
		umsg.Float( index )
		umsg.End()
		
	end
	
end

e2function void popupButtonTitle( number index, string title, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		editButton( index, ply )
		
		umsg.Start("call_vgui_setButtonTitle", ply)
		umsg.String( title )
		umsg.End()
		
	end
	
end

e2function void popupParentButton( number index, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_setParentButton", ply)
		umsg.Float( index )
		umsg.End()
		
	end
	
end

e2function void popupButtonPos( number index, number sizex, number sizey, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_setVarX", ply)
		umsg.Float( sizex )
		umsg.End()
		
		umsg.Start("call_vgui_setVarY", ply)
		umsg.Float( sizey )
		umsg.End()
		
		umsg.Start("call_vgui_setButtonPos", ply)
		umsg.Float( index )
		umsg.End()
	end
	
end

e2function void popupSetPos( number sizex, number sizey, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_setVarX", ply)
		umsg.Float( sizex )
		umsg.End()
		
		umsg.Start("call_vgui_setVarY", ply)
		umsg.Float( sizey )
		umsg.End()
		
		umsg.Start("call_vgui_setPos", ply)
		umsg.End()
	end
	
end

e2function void popupButtonSize( number index, number sizex, number sizey, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		editButton( index, ply )
		
		umsg.Start("call_vgui_setButtonWidth", ply)
		umsg.Float( sizex )
		umsg.End()
		
		umsg.Start("call_vgui_setButtonHeight", ply)
		umsg.Float( sizey )
		umsg.End()
	end
	
end

e2function void popupSize( number sizex, number sizey, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_setWidth", ply)
		umsg.Float( sizex )
		umsg.End()
		
		umsg.Start("call_vgui_setHeight", ply)
		umsg.Float( sizey )
		umsg.End()
	end
	
end

e2function void popupCreate( entity ply ) 
	if(hasAccess( self.player, false ) or isFriendOrNot2( self.player, ply )) then
		targetPly( ply )
		local Player = getPlayer( self.player, ply )
		
		umsg.Start("call_frame_vgui", Player)
		umsg.End()
		
	end
	
end

e2function void popupSetTitle( string title, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_setTitle", ply)
		umsg.String( title )
		umsg.End()
		
	end
	
end

e2function void popupSetVisible( number visible, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_setVisible", ply)
		if(visible == 1) then umsg.Bool( true ) else umsg.Bool( false ) end
		
		umsg.End()
		
	end
	
end

e2function void popupMakePopup( number makePopup, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_makePopup", ply)
		if(makePopup == 1) then umsg.Bool( true ) else umsg.Bool( false ) end
		umsg.End()
		
	end
	
end

e2function void popupSetDraggable( number setDraggable, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_setDraggable", ply)
		if(setDraggable == 1) then umsg.Bool( true ) else umsg.Bool( false ) end
		umsg.End()
		
	end
	
end

e2function void popupShowCloseButton( number showCloseButton, entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_showCloseButton", ply)
		if(showCloseButton == 1) then umsg.Bool( true ) else umsg.Bool( false ) end
		umsg.End()
		
	end
	
end

e2function void popupCenter( entity ply ) 
	if(hasAccess( self.player, false )) then
		targetPly( ply )
		umsg.Start("call_vgui_center", ply)
		umsg.End()
		
	end
	
end

e2function void popupHTML( string url, entity ply )
	if(hasAccess( self.player, false ) or isFriendOrNot2( self.player, ply )) then
		local Player = getPlayer( self.player, ply )
		targetPly( ply )
		
		sendOpenHTML( Player, url )
	end
end

