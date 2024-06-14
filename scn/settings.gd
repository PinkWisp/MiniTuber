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
# Depricated: If windowed you cant tell when you click out of the transparent app
#@onready var adjust_window = $%AdjustWindow


# Buttons from Menu
@onready var ChalkButton = get_node("/root/Main/BottomUIArea/HSplitContainer/VBoxContainer/ChalkButton")
@onready var NotesButton = get_node("/root/Main/BottomUIArea/HSplitContainer/VBoxContainer/NotesButton")
@onready var MiniButton = get_node("/root/Main/BottomUIArea/HSplitContainer/MiniTuber")
@onready var UserNamed = get_node("/root/Main/BottomUIArea/HSplitContainer/VBoxContainer/BottomMove")
#@onready var bottom_ui_area = get_node("/root/Main/BottomUIArea")


signal keybindings
signal namechanged

func _ready():
	# Depricated: If windowed you cant tell when you click out of the transparent app
	#var video_settings = ConfigHandler.load_video_settings()
	#if video_settings.window_size == Vector2i():
		#_default_size()
	#else:
		#DisplayServer.window_set_size(video_settings.window_size)
		#DisplayServer.window_set_position(video_settings.window_position)
	#if video_settings.menu_position == Vector2():
		#_default_menu_position()
	#else:
		#bottom_ui_area.global_position = video_settings.menu_position
	
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

# Video Getting 
# Depricated: If windowed you cant tell when you click out of the transparent app
#func _on_adjust_window_toggled(toggled_on):
	#if toggled_on:
		#adjust_window.text = "Adjusting Window..."
		#if DisplayServer.window_get_size() == Vector2i(1920,1080):
			#DisplayServer.window_set_size(Vector2i(1900,1060))
		#DisplayServer.window_set_min_size(Vector2i(500,500))
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		#DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
	#else:
		#adjust_window.text = "Adjust Window"
		#var new_size = DisplayServer.window_get_size_with_decorations()
		#var new_position = DisplayServer.window_get_position_with_decorations()
		#DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		#
		#ConfigHandler.save_video_settings("window_size", new_size)
		#ConfigHandler.save_video_settings("window_position", new_position)
#
#func _default_size():
		#DisplayServer.window_set_size(Vector2i(1920,1080))
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
		#var new_size = DisplayServer.window_get_size_with_decorations()
		#var new_position = DisplayServer.window_get_position_with_decorations()
		#
		#ConfigHandler.save_video_settings("window_size", new_size)
		#ConfigHandler.save_video_settings("window_position", new_position)
#
#
#func _on_default_size_pressed():
	#_default_size()
#
#func _default_menu_position():
	#bottom_ui_area.global_position = Vector2(355, 1004)
