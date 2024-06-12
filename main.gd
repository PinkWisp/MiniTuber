extends Node
# works in OBS Display Capture


func _ready():
	get_tree().get_root().set_transparent_background(true) #transparent BG
	
func _input(event):
	## quick debugging
	#if Input.is_action_just_pressed("Close"):
		#get_tree().quit()

	if Input.is_action_just_pressed("RMB"):
		if GlobalVar.chalkState == true:                                   
			DisplayServer.window_set_mouse_passthrough($%ButtonArea.polygon)
			GlobalVar.chalkState = false
			print("RMB")


func _process(_delta):
	pass

#func _on_chalk_pressed():
	#DisplayServer.window_set_mouse_passthrough($TransBG.polygon)
	#chalkState = true
	#noteState = false
	#
#func _on_note_pad_pressed():
	#chalkState = false
	#noteState = true

#func _on_mini_tuber_pressed():
	#DisplayServer.window_set_mouse_passthrough($TransBG.polygon)
	#chalkState = false
	#noteState = false
