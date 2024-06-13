extends Sprite2D

var dragging = false
var offSet = Vector2(0,0)

func _ready():
	_set_passthrough()
	%BottomMove.text = GlobalVar.username
	
func _process(delta):
	if dragging:
		position = get_global_mouse_position() - offSet

func _on_bottom_move_button_down():
	dragging = true
	offSet = get_global_mouse_position() - global_position
	DisplayServer.window_set_mouse_passthrough(GlobalVar.transBG)


func _on_bottom_move_button_up():
	dragging = false # Replace with function body.
	_set_passthrough()

func _set_passthrough():
	var areaCenter : Vector2 = texture.get_size() / 2 # Center
	var areaCorners: PackedVector2Array = [
	global_position + areaCenter * Vector2(-1, -1), # Top left corner
	global_position + areaCenter * Vector2(1, -1), # Top right corner
	global_position + areaCenter * Vector2(1 , 1), # Bottom right corner
	global_position + areaCenter * Vector2(-1 ,1) # Bottom left corner
  ]
	DisplayServer.window_set_mouse_passthrough(areaCorners)
	GlobalVar.buttonMenu = areaCorners

