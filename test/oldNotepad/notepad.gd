extends Control

#func _on_note_button_toggled(button_pressed):
	#if button_pressed:
		#$PanelContainer.visible = true
	#else:
		#$PanelContainer.visible = false
		
#quick debugging
#func _input(event):
	#if Input.is_action_just_pressed("LMB"):
		#$PanelContainer.visible = true
	#if Input.is_action_just_pressed("RMB"):
		#$PanelContainer.visible = false

func _on_note_pad_pressed(button_pressed):
	if button_pressed:
		$PanelContainer.visible = true
	else:
		$PanelContainer.visible = false

