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


func _process(_delta):
	pass
