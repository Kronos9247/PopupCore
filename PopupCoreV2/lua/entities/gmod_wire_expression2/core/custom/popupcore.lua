E2Lib.RegisterExtension("popupcore", false)

include( "popupcore/modules/expression2/init.lua" )
AddCSLuaFile( "entities/gmod_wire_expression2/core/custom/cl_popupcore.lua" )

--------------------------[[ DFrame ]]--------------------------
e2function void popupCreate( number id, entity ply )
	PopupCore.DFrame.popupCreate( self.player, id, ply )
end

e2function void popupSetTitle( number id, entity player, string title )
	PopupCore.DFrame.popupSetTitle( self.player, id, player, title )
end

e2function void popupSetPos( number id, entity player, vector2 pos )
	PopupCore.DFrame.popupSetPos( self.player, id, player, pos )
end

e2function void popupSetSize( number id, entity player, vector2 size )
	PopupCore.DFrame.popupSetSize( self.player, id, player, size )
end

e2function void popupMakePopup( number id, entity player )
	PopupCore.DFrame.popupMakePopup( self.player, id, player )
end

e2function void popupSetDraggable( number id, entity player, normal bool )
	PopupCore.DFrame.popupSetDraggable( self.player, id, player, PopupCoreLib.E2BoolToBool( bool ) )
end

e2function void popupCenter( number id, entity player )
	PopupCore.DFrame.popupCenter( self.player, id, player )
end

e2function void popupClose( number id, entity player )
	PopupCore.DFrame.popupClose( self.player, id, player )
end

e2function void popupShowCloseButton( number id, entity player, normal bool )
	PopupCore.DFrame.popupShowCloseButton( self.player, id, player, PopupCoreLib.E2BoolToBool( bool ) )
end

e2function void popupSetSizable( number id, entity player, normal bool )
	PopupCore.DFrame.popupSetSizable( self.player, id, player, PopupCoreLib.E2BoolToBool( bool ) )
end
--------------------------[[ DFrame End ]]--------------------------


--------------------------[[ DButton ]]--------------------------
e2function void pbuttonCreate( number id, entity ply, number parentDFrame )
	PopupCore.DButton.pbuttonCreate( self.player, id, ply, parentDFrame )
end

e2function void pbuttonSetTitle( number id, entity ply, string title )
	PopupCore.DButton.pbuttonSetTitle( self.player, id, ply, title )
end

e2function void pbuttonSetPos( number id, entity player, vector2 pos )
	PopupCore.DButton.pbuttonSetPos( self.player, id, player, pos )
end

e2function void pbuttonSetSize( number id, entity player, vector2 size )
	PopupCore.DButton.pbuttonSetSize( self.player, id, player, size )
end

e2function void pbuttonSetEnabled( number id, entity player, normal bool )
	PopupCore.DButton.pbuttonSetEnabled( self.player, id, player, PopupCoreLib.E2BoolToBool( bool ) )
end

e2function void pbuttonSetImage( number id, entity player, string img )
	PopupCore.DButton.pbuttonSetImage( self.player, id, player, img )
end

e2function void pbuttonAddFunc( number id, entity player )
	PopupCore.DButton.pbuttonAddFunc( self.player, id, player )
end

e2function normal pbuttonIsPressed( number id, entity player )
	local bool = PopupCore.DButton.pbuttonIsPressed( self.player, id, player )
	return PopupCoreLib.BoolToE2Bool( bool )
end

e2function void pbuttonSetVisible( number id, entity player, normal bool )
	PopupCore.DButton.pbuttonSetVisible( self.player, id, player, PopupCoreLib.E2BoolToBool( bool ) )
end

e2function void pbuttonRemove( number id, entity player )
	PopupCore.DButton.pbuttonRemove( self.player, id, player )
end
--------------------------[[ DButton End ]]--------------------------


--------------------------[[ DHtml ]]--------------------------
e2function void pHtmlCreate( number id, entity ply, number parentDFrame )
	PopupCore.DHTML.pHtmlCreate( self.player, id, ply, parentDFrame )
end

e2function void pHtmlSetPos( number id, entity player, vector2 pos )
	PopupCore.DHTML.pHtmlSetPos( self.player, id, player, pos )
end

e2function void pHtmlSetSize( number id, entity player, vector2 size )
	PopupCore.DHTML.pHtmlSetSize( self.player, id, player, size )
end

e2function void pHtmlDock( number id, entity player, number dockType )
	PopupCore.DHTML.pHtmlDock( self.player, id, player, dockType )
end

e2function void pHtmlOpenURL( number id, entity player, string url )
	PopupCore.DHTML.pHtmlOpenURL( self.player, id, player, url )
end
--------------------------[[ DHtml End ]]--------------------------


--------------------------[[ DComboBox ]]--------------------------
e2function void pComboBoxCreate( number id, entity ply, number parentDFrame )
	PopupCore.DComboBox.pComboBoxCreate( self.player, id, ply, parentDFrame )
end

e2function void pComboBoxSetPos( number id, entity ply, vector2 pos )
	PopupCore.DComboBox.pComboBoxSetPos( self.player, id, ply, pos )
end

e2function void pComboBoxSetSize( number id, entity ply, vector2 size )
	PopupCore.DComboBox.pComboBoxSetSize( self.player, id, ply, size )
end

e2function void pComboBoxSetValue( number id, entity ply, string value )
	PopupCore.DComboBox.pComboBoxSetValue( self.player, id, ply, value )
end

e2function void pComboBoxAddChoice( number id, entity ply, string choice, number data )
	PopupCore.DComboBox.pComboBoxAddChoice( self.player, id, ply, choice, data )
end

e2function void pComboBoxAddFunc( number id, entity ply )
	PopupCore.DComboBox.pComboBoxAddFunc( self.player, id, ply )
end

e2function normal pComboBoxOnSelect( number id, entity ply )
	local bool = PopupCore.DComboBox.pComboBoxOnSelect( self.player, id, ply )
	return PopupCoreLib.BoolToE2Bool( bool )
end

e2function number pComboBoxSelectedIndex( number id, entity ply )
	return PopupCore.DComboBox.pComboBoxSelectedIndex( self.player, id, ply )
end

e2function number pComboBoxSelectedData( number id, entity ply )
	return PopupCore.DComboBox.pComboBoxSelectedData( self.player, id, ply )
end

e2function string pComboBoxSelectedValue( number id, entity ply )
	return PopupCore.DComboBox.pComboBoxSelectedValue( self.player, id, ply )
end
--------------------------[[ DComboBox End ]]--------------------------


--------------------------[[ DLabel ]]--------------------------
e2function void pLabelCreate( number id, entity ply, number parentDFrame )
	PopupCore.DLabel.pLabelCreate( self.player, id, ply, parentDFrame )
end

e2function void pLabelSetPos( number id, entity ply, vector2 pos )
	PopupCore.DLabel.pLabelSetPos( self.player, id, ply, pos )
end

e2function void pLabelSetSize( number id, entity ply, vector2 size )
	PopupCore.DLabel.pLabelSetSize( self.player, id, ply, size )
end

e2function void pLabelSetText( number id, entity ply, string text )
	PopupCore.DLabel.pLabelSetText( self.player, id, ply, text )
end
--------------------------[[ DLabel End ]]--------------------------