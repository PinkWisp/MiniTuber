extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	##get_window().transparent_bg = true
	#DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_TRANSPARENT, true, 0)
	#DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_MOUSE_PASSTHROUGH, true, 0)
	#DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_ALWAYS_ON_TOP, true, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$ColorRect.set_color(Color.MEDIUM_PURPLE) # Replace with function body.
#
#
func _on_button_2_pressed():
	$ColorRect.set_color(Color.LIGHT_SEA_GREEN) # Replace with function body.
