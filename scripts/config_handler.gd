extends Node

var config = ConfigFile.new()
const settingsPath = "user://settings.ini"

func _ready():
	if !FileAccess.file_exists(settingsPath):
		# Keybindings
		config.set_value("keybindings", "Action", "Left Mouse Button")
		config.set_value("keybindings", "Move", "Right Mouse Button")
		config.set_value("keybindings", "Emote Menu", "Middle Mouse Button")
		config.set_value("keybindings", "Cancel Action", "Mouse Wheel Down")
		config.set_value("keybindings", "Clear Chalk", "Right Mouse Button")

		config.set_value("video", "aspect_ratio", true)
		config.set_value("video", "window_position", Vector2())
		
		config.set_value("features", "chalk_function", true)
		config.set_value("features", "notebook_function", true)
		config.set_value("features", "minituber_function", true)
		
		config.set_value("Customization", "username", "")
		config.set_value("Customization", "chalk_color", Color(1,1,1,1))
		config.set_value("Customization", "notebook_dir", "Default")
		config.set_value("Customization", "minituber_dir", "Default")
		
		config.save(settingsPath)
	else:
		config.load(settingsPath)

func save_video_settings(key: String, value):
	config.set_value("video", key, value)
	config.save(settingsPath)
	
func load_video_settings():
	var videoSettings = {}
	for key in config.get_section_keys("video"):
		videoSettings[key] = config.get_value("video", key)
	return videoSettings
	
func save_feature_settings(key:String, value):
	config.set_value("features", key, value)
	config.save(settingsPath)
	
func load_feature_settings():
	var featureSettings = {}
	for key in config.get_section_keys("features"):
		featureSettings[key] = config.get_value("features", key)
	return featureSettings
	
func save_customization_settings(key: String, value):
	config.set_value("customization", key, value)
	config.save(settingsPath)
	
func load_customization_settings():
	var customizationSettings = {}
	for key in config.get_section_keys("customization"):
		customizationSettings[key] = config.get_value("customization", key)
	return customizationSettings


# Keybindings
func save_keybinds(action: StringName, event: InputEvent):
	var event_str
	if event is InputEventKey:
		event_str = OS.get_keycode_string(event.physical_keycode)
	elif event is InputEventMouseButton:
		event_str = "mouse_" + str(event.button_index)
	
	config.set_value("keybindings", action, event_str)
	config.save(settingsPath)
	
func load_keybindings():
	var keybindings = {}
	var keys = config.get_sections_keys("keybindings")
	
	for key in keys:
		var input_event
		var event_str = config.get_value("keybindings", key)
		
		if event_str.contains("mouse_"):
			input_event = InputEventMouseButton.new()
			input_event.button_index = int(event_str.split("_")[1])
		else:
			input_event = InputEventKey.new()
			input_event.keycode = OS.find_keycode_from_string(event_str)
			
		keybindings[key] = input_event
	return keybindings
