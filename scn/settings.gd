extends Control

# Features
@onready var chalk_function = $%Chalk
@onready var notebook_function = $%NoteBook
@onready var minituber_function = $%MiniTuber
#Customization
@onready var username = $%LineEdit
#@onready var chalk_color = $%ColorPickerButton
#@onready var notebook_dir = $%NotebookDir
#@onready var minituber_dir = $%MiniTuberDir
#Video
@onready var aspect_ratio = $%AspectRatio

signal keybindings

func _on_settings_pressed():
	visible = !visible # Replace with function body.
	if visible == true:
		DisplayServer.window_set_mouse_passthrough(GlobalVar.transBG)
	if visible == false:
		DisplayServer.window_set_mouse_passthrough(GlobalVar.buttonMenu)


# Customization
func _on_line_edit_text_submitted(new_text):
	ConfigHandler._save_customization_settings("username", "")
	#GlobalVar.username = new_text
	#$%LineEdit.text = new_text


# Features
func _on_mini_tuber_toggled(toggled_on):
	ConfigHandler._save_feature_settings("minituber", toggled_on)
	#if toggled_on:
		#GlobalVar.miniFunction = true
	#else:
		#GlobalVar.miniFunction = false

func _on_chalk_toggled(toggled_on):
	ConfigHandler._save_feature_settings("chalk", toggled_on)
	#if toggled_on:
		#GlobalVar.chalkFunction = true
	#else:
		#GlobalVar.chalkFunction = false

func _on_note_book_toggled(toggled_on):
	ConfigHandler._save_feature_settings("notebook", toggled_on)
	#if toggled_on:
		#GlobalVar.noteFunction = true
	#else:
		#GlobalVar.noteFunction = false



func _on_keybindings_pressed():
	emit_signal("keybindings")
