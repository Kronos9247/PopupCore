if CLIENT then
	AddCSLuaFile( "cl_popup.lua" )
	
end

local DermaPanel = {}
local HTML = {}

--local Buttons = {}
local ModelPanels = {}
local Labels = {}
local TextFields = {}
local ComboBoxs = {}

local Ply;

local TargetButton = 0;
local X = 0;
local Y = 0;
local player;

local function getArray( ply, array, index )
	
	return array[ply:SteamID()][Index]
end

local function setPly( ply )
	
	Ply=ply:ReadEntity()
	
end
usermessage.Hook( "call_vgui_targetPly", setPly, entity )

local function targetButton( index )
	
	TargetButton = index:ReadFloat()
	
 end
usermessage.Hook( "call_vgui_targetButton", targetButton, float )

local function isInArray( ply, array ) 
	local Number = 0

	for k,v in pairs(array) do
		if(k == ply:SteamID()) then Number=1 end
		
	end
	
	return Number
end

local function checkArrays( ply )
	
	Buttons[ply:SteamID()] = {}
	ModelPanels[ply:SteamID()] = {}
	Labels[ply:SteamID()] = {}
	TextFields[ply:SteamID()] = {}
	ComboBoxs[ply:SteamID()] = {}

end

local function showPopup()
	local DermPanel = vgui.Create( "DFrame" )
	DermPanel:SetSize( 100, 100 )
	DermPanel:SetDeleteOnClose( true )
	DermPanel:ShowCloseButton( true )
	
	checkArrays( Ply )
	
	DermaPanel[Ply:SteamID()] = DermPanel
end
usermessage.Hook( "call_frame_vgui", showPopup)

local function closePopup()
	DermaPanel[Ply:SteamID()]:Undo()
	
end
usermessage.Hook( "call_vgui_closePopup", closePopup)

local function ShowHTMLPopup( url )
	
	local DHTML = vgui.Create( "HTML" )
	DHTML:SetParent( DermaPanel[Ply:SteamID()] ) 
	DHTML:Dock( FILL )
	DHTML:OpenURL( url:ReadString() )
	
	HTML[Ply:SteamID()] = DHTML
 
 end
usermessage.Hook( "call_html_vgui", ShowHTMLPopup, string )

--ComboBoxs
local function addComboBox( index )
	
	local Index = index:ReadFloat()
	
	--ComboBoxs[Index] = vgui.Create( "DComboBox" )
	--ComboBoxs[Index]:SetParent( DermaPanel )
	local ComboBox = ComboBoxs[Ply:SteamID()]
	ComboBox[Index] = vgui.Create( "DComboBox" )
	ComboBox[Index]:SetParent( DermaPanel[Ply:SteamID()] )
	
end
usermessage.Hook( "call_vgui_addComboBox", addComboBox, float )

local function setComboBoxValue( title )
	
	local ComboBox = ComboBoxs[Ply:SteamID()]
	ComboBox[TargetButton]:SetValue( title:ReadString() )
	
end
usermessage.Hook( "call_vgui_setComboBoxValue", setComboBoxValue, string )

local function addComboBoxChoice( title )
	
	local ComboBox = ComboBoxs[Ply:SteamID()]
	ComboBox[TargetButton]:AddChoice( title:ReadString() )
	
end
usermessage.Hook( "call_vgui_addComboBoxChoice", addComboBoxChoice, string )

local function setComboBoxPos( index )
	
	local ComboBox = ComboBoxs[Ply:SteamID()]
	ComboBox[index:ReadFloat()]:SetPos( X, Y )
 
end
usermessage.Hook( "call_vgui_setComboBoxPos", setComboBoxPos, float )

local function setComboBoxSize( index )
	
	local ComboBox = ComboBoxs[Ply:SteamID()]
	ComboBox[index:ReadFloat()]:SetSize( X, Y )
 
end
usermessage.Hook( "call_vgui_setComboBoxSize", setComboBoxSize, float )


local function funcComboBoxChoise( uuid )
	
	local UUID = uuid:ReadString()
	
	local ComboBox = ComboBoxs[Ply:SteamID()]
	ComboBox[TargetButton].OnSelect = function( panel, index, value )
		
		net.Start( "call_vgui_Combobox_func" )
			net.WriteString( UUID )
			net.WriteFloat( index )
			net.WriteString( value )
			net.WriteString( Ply:SteamID() )
		net.SendToServer()
		
	end
 
end
usermessage.Hook( "call_vgui_funcComboBoxChoise", funcComboBoxChoise, string )
--end

--Labels
local function addLabel( index )
	
	local Index = index:ReadFloat()
	
	local Label = Labels[Ply:SteamID()]
	
	Label[Index] = vgui.Create( "DLabel" )
	Label[Index]:SetParent( DermaPanel[Ply:SteamID()] )
	
end
usermessage.Hook( "call_vgui_addLabel", addLabel, float )

local function setLabelText( name )
	
	local Label = Labels[Ply:SteamID()]
	Label[TargetButton]:SetText( name:ReadString() )
 
end
usermessage.Hook( "call_vgui_setLabelText", setLabelText, string )

local function getLabelText( index )
	
	local Label = Labels[Ply:SteamID()]
	net.Start( "call_vgui_Label_getText" )
		net.WriteString( Label[index:ReadFloat()]:GetText() )
		net.WriteString( Ply:SteamID() )
	net.SendToServer()
 
end
usermessage.Hook( "call_vgui_getLabelText", getLabelText, float )

local function setLabelPos( index )
	
	local Label = Labels[Ply:SteamID()]
	Label[index:ReadFloat()]:SetPos( X, Y )
 
end
usermessage.Hook( "call_vgui_setLabelPos", setLabelPos, float )

--end

--Model Panels
local function addModelPanel( index )
	
	local Index = index:ReadFloat()
	
	local ModelPanel = ModelPanels[Ply:SteamID()]
	
	ModelPanel[Index] = vgui.Create( "DModelPanel", DermaPanel[Ply:SteamID()] )
	--ModelPanels[Index]:SetParent( DermaPanel )
	ModelPanel[Index]:SetVisible( true )
	ModelPanel[Index]:SetLookAt( Vector( 0, 0, 0 ) )
	ModelPanel[Index]:SetCamPos( Vector( 10, 10, 10 ) )
 
end
usermessage.Hook( "call_vgui_addModelPanel", addModelPanel, float )

local function addModelPanelOnButton( index )
	
	local ModelPanel = ModelPanels[Ply:SteamID()]
	local Button = Buttons[Ply:SteamID()]
	
	local buttonIndex = index:ReadFloat()
	
	ModelPanel[TargetButton] = vgui.Create( "DModelPanel", Button[buttonIndex] )
	--ModelPanels[TargetButton]:SetParent( Buttons[buttonIndex] )
	ModelPanel[TargetButton]:SetPos( 0, 0 )
	ModelPanel[TargetButton]:SetWidth( Buttons[buttonIndex]:GetWide() )
	--ModelPanels[TargetButton]:SetHeight( 100 )
	ModelPanel[TargetButton]:CopyHeight( Buttons[buttonIndex] ) 
	ModelPanel[TargetButton]:SetLookAt( Vector( 0, 0, 0 ) )
	ModelPanel[TargetButton]:SetCamPos( Vector( 10, 10, 10 ) )
 
end
usermessage.Hook( "call_vgui_addModelPanelOnButton", addModelPanelOnButton, float )

local function setModelModelPanel( model )
	
	local ModelPanel = ModelPanels[Ply:SteamID()]
	ModelPanel[TargetButton]:SetModel( model:ReadString() )
 
end
usermessage.Hook( "call_vgui_setModelModelPanel", setModelModelPanel, string )

local function getModelModelPanel( index )
	
	local ModelPanel = ModelPanels[Ply:SteamID()]
	net.Start( "call_vgui_ModelPanel_getModel" )
		net.WriteString( ModelPanel[index:ReadFloat()]:GetModel() )
		net.WriteString( Ply:SteamID() )
	net.SendToServer()
 
end
usermessage.Hook( "call_vgui_getModelModelPanel", getModelModelPanel, float )

local function setModelPanelPos( index )
	
	local ModelPanel = ModelPanels[Ply:SteamID()]
	ModelPanel[TargetButton]:SetPos( X, Y )
 
end
usermessage.Hook( "call_vgui_setModelPanelPos", setModelPanelPos, string )
--end

--Buttons
local function addButton( index )
	
	local Button = Buttons[Ply:SteamID()]
	Button[index:ReadFloat()] = vgui.Create( "DButton" )
	--Buttons[index:ReadFloat()]:SetParent( DermaPanel ) 
 
 end
usermessage.Hook( "call_vgui_addButton", addButton, float )

local function setButtonConVar( uuid )
	
	local Button = Buttons[Ply:SteamID()]
	local UUID = uuid:ReadString()
	Button[TargetButton].DoClick = function()
		
		net.Start( "popupcore_buttonclk_click")
			net.WriteString( UUID )
			net.WriteString( Ply:SteamID() )
		net.SendToServer()
		
	end
	
end
usermessage.Hook( "call_vgui_setButtonConVar", setButtonConVar, string )

local function setButtonTitle( title )
	
	local Button = Buttons[Ply:SteamID()]
	Button[TargetButton]:SetText(title:ReadString()) 
	
end
usermessage.Hook( "call_vgui_setButtonTitle", setButtonTitle, string )

local function setParentButton( index )

	local Button = Buttons[Ply:SteamID()]
	Button[index:ReadFloat()]:SetParent(DermaPanel[Ply:SteamID()]) 
	
 end
usermessage.Hook( "call_vgui_setParentButton", setParentButton, float )

local function setButtonWidth( width )

	local Button = Buttons[Ply:SteamID()]
	Button[TargetButton]:SetWidth( width:ReadFloat() )
	
 end
usermessage.Hook( "call_vgui_setButtonWidth", setButtonWidth, float )

local function setButtonHeight( height )
	
	local Button = Buttons[Ply:SteamID()]
	Button[TargetButton]:SetHeight( height:ReadFloat() )
	
 end
usermessage.Hook( "call_vgui_setButtonHeight", setButtonHeight, float )



local function setVarX( x )
	
	X = x:ReadFloat()
	
 end
usermessage.Hook( "call_vgui_setVarX", setVarX, float )

local function setVarY( y )
	
	Y = y:ReadFloat() 
	
 end
usermessage.Hook( "call_vgui_setVarY", setVarY, float )

local function setButtonPos( index )
	
	local Button = Buttons[Ply:SteamID()]
	Button[index:ReadFloat()]:SetPos( X, Y )
	
end
usermessage.Hook( "call_vgui_setButtonPos", setButtonPos, float )

--end

local function setPos( )
	
	DermaPanel[Ply:SteamID()]:SetPos(X, Y)
	
 end
usermessage.Hook( "call_vgui_setPos", setPos )

local function setWidth( width )
	DermaPanel[Ply:SteamID()]:SetWidth( width:ReadFloat() ) 
 
 end
usermessage.Hook( "call_vgui_setWidth", setWidth, float )

local function setHeight( height )
	DermaPanel[Ply:SteamID()]:SetHeight( height:ReadFloat() )
 
 end
usermessage.Hook( "call_vgui_setHeight", setHeight, float )

local function center(  )
	DermaPanel[Ply:SteamID()]:Center()
 
 end
usermessage.Hook( "call_vgui_center", center )

local function setTitle( title )
	DermaPanel[Ply:SteamID()]:SetTitle( title:ReadString() )
 
 end
usermessage.Hook( "call_vgui_setTitle", setTitle, string )

local function setVisible( bool )
	DermaPanel[Ply:SteamID()]:SetVisible( bool:ReadBool() )
 
 end
usermessage.Hook( "call_vgui_setVisible", setVisible, bool)

local function makePopup( bool )
	DermaPanel[Ply:SteamID()]:MakePopup( bool:ReadBool() )
 
 end
usermessage.Hook( "call_vgui_makePopup", makePopup, bool)

local function setDraggable( bool )
	DermaPanel[Ply:SteamID()]:SetDraggable( bool:ReadBool() )
 
 end
usermessage.Hook( "call_vgui_setDraggable", setDraggable, bool)

local function showCloseButton( bool )
	DermaPanel[Ply:SteamID()]:ShowCloseButton( bool:ReadBool() )
 
 end
usermessage.Hook( "call_vgui_showCloseButton", showCloseButton, bool)

