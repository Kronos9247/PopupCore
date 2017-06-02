if CLIENT then
	net.Receive( "PopupCore_CreateCheckBox", function( len ) 
		local Owner, Player, ID = PopupCoreLib.NetReadData()
		local parentId = net.ReadFloat()
		
		local obj = vgui.Create( "DCheckBoxLabel", PopupCoreLib.GetData( "DFrame", Owner, Player, parentId ) )
		
		PopupCoreLib.SaveData( "DCheckBox", Owner, Player, ID, obj )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetPosCheckBox", "DCheckBox", function( len, obj ) 
		local Pos = PopupCoreLib.NetReadVector2D()
		
		obj:SetPos( Pos[1], Pos[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetSizeCheckBox", "DCheckBox", function( len, obj ) 
		local Size = PopupCoreLib.NetReadVector2D()
		
		obj:SetSize( Size[1], Size[2] )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetValueCheckBox", "DCheckBox", function( len, obj ) 
		local Value = net.ReadBool()
		
		obj:SetValue( Value )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_SetTextCheckBox", "DCheckBox", function( len, obj ) 
		local Text = net.ReadString()
		
		obj:SetText( Text )
	end )
	
	PopupCoreLib.NetReceive( "PopupCore_RequestDataCheckBox", "DCheckBox", function( len, obj, Owner, Player, ID ) 
		PopupCoreLib.NetSend( "PopupCore_SendDataCheckBox", function()
			net.WriteEntity( Owner )
			net.WriteEntity( Player )
			net.WriteFloat( ID )
			
			--if obj:GetChecked() then
				--net.WriteBool( obj:GetChecked() )
			--else net.WriteBool( false ) end
			
			PopupCoreLib.CheckObject( obj, function( obj )
				net.WriteBool( obj:GetChecked() )
			end, function() net.WriteBool( false ) end )
		end )
	end )
end