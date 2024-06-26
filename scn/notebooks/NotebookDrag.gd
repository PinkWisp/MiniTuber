extends Sprite2D

@onready var NotesButton = get_node("/root/Main/BottomUIArea/HSplitContainer/VBoxContainer/NotesButton")
@onready var settings = $"../Settings"

var dragging = false
var offSet = Vector2(0,0)

signal selectingFolder

func _ready():
	#_set_passthrough()
	pass

func _on_note_move_button_down():
	dragging = true
	offSet = get_global_mouse_position() - global_position
	DisplayServer.window_set_mouse_passthrough(GlobalVar.transBG)

func _on_note_move_button_up():
	dragging = false 
	_set_passthrough()
	if GlobalVar.chalkState || settings.visible == false:
		DisplayServer.window_set_mouse_passthrough(GlobalVar.bookArray)
	
func _process(delta):
	if dragging:
		position = get_global_mouse_position() - offSet

func _set_passthrough():
	var areaCenter : Vector2 = texture.get_size() / 2 # Center
	var areaCorners: PackedVector2Array = [
	global_position + areaCenter * Vector2(-1, -1), # Top left corner
	global_position + areaCenter * Vector2(1, -1), # Top right corner
	global_position + areaCenter * Vector2(1 , 1), # Bottom right corner
	global_position + areaCenter * Vector2(-1 ,1) # Bottom left corner
  ]
	GlobalVar.bookArray = areaCorners


func _on_note_move_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			emit_signal("selectingFolder")
			$FileDialog.popup()

func _on_close_note_pressed():
	visible = false
	NotesButton.button_pressed = false
	if GlobalVar.chalkState || settings.visible == false:
		DisplayServer.window_set_mouse_passthrough(GlobalVar.menuArray)


func _on_notes_button_toggled(toggled_on):
	if toggled_on:
		visible = true
		if GlobalVar.chalkState || settings.visible == false:
			DisplayServer.window_set_mouse_passthrough(GlobalVar.bookArray)
	else:
		visible = false
		if GlobalVar.chalkState || settings.visible == false:
			DisplayServer.window_set_mouse_passthrough(GlobalVar.menuArray)

