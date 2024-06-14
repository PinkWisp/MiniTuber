extends Control

# Features (buttons in Settings NOT MENU)
@onready var chalk_function = %Chalk
@onready var notebook_function = %NoteBook
@onready var minituber_function = %MiniTuber
#Customization
@onready var username = $%LineEdit
#@onready var chalk_color = $%ColorPickerButton
#@onready var notebook_dir = $%NotebookDir
#@onready var minituber_dir = $%MiniTuberDir
#Video
@onready var adjust_window = $%AdjustWindow

# Buttons from Menu
@onready var ChalkButton = get_node("/root/Main/BottomUIArea/HSplitContainer/VBoxContainer/ChalkButton")
@onready var NotesButton = get_node("/root/Main/BottomUIArea/HSplitContainer/VBoxContainer/NotesButton")
@onready var MiniButton = get_node("/root/Main/BottomUIArea/HSplitContainer/MiniTuber")
@onready var UserNamed = get_node("/root/Main/BottomUIArea/HSplitContainer/VBoxContainer/BottomMove")

signal keybindings
signal namechanged

func _ready():
	#var video_settings = ConfigHandler.load_video_settings()
	
	# Features
	var function_settings = ConfigHandler.load_feature_settings()
	chalk_function.button_pressed = function_settings.chalk_on
	if chalk_function.button_pressed:
		ChalkButton.visible = true
	else:
		ChalkButton.visible = false
		
	notebook_function.button_pressed = function_settings.notebook_on
	if notebook_function.button_pressed:
		NotesButton.visible = true
	else:
		NotesButton.visible = false
		
	minituber_function.button_pressed = function_settings.minituber_on
	if minituber_function.button_pressed:
		MiniButton.visible = true
	else:
		MiniButton.visible = false
		
	# Customization
	var customization_settings = ConfigHandler.load_customization_settings()
	UserNamed.text = customization_settings.username
	username.text = customization_settings.username
	#if username.text = "new_text":
		

func _on_settings_pressed():
	visible = !visible # Replace with function body.
	if visible == true:
		DisplayServer.window_set_mouse_passthrough(GlobalVar.transBG)
	if visible == false:
		DisplayServer.window_set_mouse_passthrough(GlobalVar.buttonMenu)


# Customization
func _on_line_edit_text_submitted(new_text):
	$%LineEdit.text = new_text
	ConfigHandler.save_customization_settings("username", new_text)
	emit_signal("namechanged", new_text)
	


# Features
func _on_chalk_toggled(toggled_on):
	if toggled_on:
		ChalkButton.visible = true
	else:
		ChalkButton.visible = false
	ConfigHandler.save_feature_settings("chalk_on", toggled_on)

func _on_note_book_toggled(toggled_on):
	if toggled_on:
		NotesButton.visible = true
	else:
		NotesButton.visible = false
	ConfigHandler.save_feature_settings("notebook_on", toggled_on)

func _on_mini_tuber_toggled(toggled_on):
	if toggled_on:
		MiniButton.visible = true
	else:
		MiniButton.visible = false
	ConfigHandler.save_feature_settings("minituber_on", toggled_on)




# Opens Keybinding Menu
func _on_keybindings_pressed():
	emit_signal("keybindings")


func _on_adjust_window_toggled(toggled_on):
	if toggled_on:
		adjust_window.text = "Adjusting Window..."
		DisplayServer.window_set_size(Vector2i(1900,1060))
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		#get_tree().get_root().set_transparent_background(false)
	else:
		adjust_window.text = "Adjust Window"
		DisplayServer.window_get_position_with_decorations()
		DisplayServer.window_get_position()
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		ConfigHandler.save_video_settings()
