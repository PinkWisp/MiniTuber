extends Sprite2D

var dragging = false
var offSet = Vector2(0,0)

func _ready():
	if visible == true:
		_set_passthrough()

func _on_note_move_button_down():
	dragging = true
	offSet = get_global_mouse_position() - global_position

func _on_note_move_button_up():
	dragging = false # Replace with function body.
	_set_passthrough()
	
func _process(delta):
	if dragging:
		position = get_global_mouse_position() - offSet

func _set_passthrough():
	var areaCenter : Vector2 = texture.get_size() / 2 # Center
	print(areaCenter)
	var areaCorners: PackedVector2Array = [
	global_position + areaCenter * Vector2(-1, -1), # Top left corner
	global_position + areaCenter * Vector2(1, -1), # Top right corner
	global_position + areaCenter * Vector2(1 , 1), # Bottom right corner
	global_position + areaCenter * Vector2(-1 ,1) # Bottom left corner
  ]
	print(areaCorners)
	DisplayServer.window_set_mouse_passthrough(areaCorners)


func _on_note_move_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT: 
			$FileDialog.popup()

func _on_close_note_pressed():
	visible = false # Replace with function body.
