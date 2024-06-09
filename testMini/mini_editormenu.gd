extends Control

@export var selectNode: TextureButton # Select TextureRect on hover

var currentTuber = "" # use FileDialog.current_dir
var selectedNode = "" # finds .png in face or hand array

signal editorSelect

signal handRotate
signal counterRotate

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

#region File Dialog Face & Hands
func _on_file_dialog_file_selected(path):
	var emote = Image.new()
	emote.load(path)
	emote.save_png(currentTuber)
	
	var emote_sprite = ImageTexture.new()
	emote_sprite.set_image(emote)

	selectNode.texture_normal = emote_sprite
#endregion

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	# quick debugging
	if Input.is_action_just_pressed("Close"):
		self.visible = !self.visible
		
func _currentTuber():
	currentTuber = str(MiniVariables.currentDir, "/", selectedNode)

func _load_Imported():
#region face
	var face1path = str(MiniVariables.currentDir,"/",MiniVariables.face[0])
	var face1 = Image.load_from_file(face1path)
	var facetext1 = ImageTexture.new()
	facetext1.set_image(face1)
	$%Face1.texture_normal = facetext1
	
	var face2path = str(MiniVariables.currentDir,"/",MiniVariables.face[1])
	var face2 = Image.load_from_file(face2path)
	var facetext2 = ImageTexture.new()
	facetext2.set_image(face2)
	$%Face2.texture_normal = facetext2
	
	var face3path = str(MiniVariables.currentDir,"/",MiniVariables.face[2])
	var face3 = Image.load_from_file(face3path)
	var facetext3 = ImageTexture.new()
	facetext3.set_image(face3)
	$%Face3.texture_normal = facetext3
	
	var face4path = str(MiniVariables.currentDir,"/",MiniVariables.face[3])
	var face4 = Image.load_from_file(face4path)
	var facetext4 = ImageTexture.new()
	facetext4.set_image(face4)
	$%Face4.texture_normal = facetext4
	
	var face5path = str(MiniVariables.currentDir,"/",MiniVariables.face[4])
	var face5 = Image.load_from_file(face5path)
	var facetext5 = ImageTexture.new()
	facetext5.set_image(face5)
	$%Face5.texture_normal = facetext5
	
	var face6path = str(MiniVariables.currentDir,"/",MiniVariables.face[5])
	var face6 = Image.load_from_file(face6path)
	var facetext6 = ImageTexture.new()
	facetext6.set_image(face6)
	$%Face6.texture_normal = facetext6
#endregion
#region Hands
	var hand1path = str(MiniVariables.currentDir,"/",MiniVariables.hand[0])
	var hand1 = Image.load_from_file(hand1path)
	var handtext1 = ImageTexture.new()
	handtext1.set_image(hand1)
	$%Hand1.texture_normal = handtext1
	
	var hand2path = str(MiniVariables.currentDir,"/",MiniVariables.hand[1])
	var hand2 = Image.load_from_file(hand2path)
	var handtext2 = ImageTexture.new()
	handtext2.set_image(hand2)
	$%Hand2.texture_normal = handtext2
	
	var hand3path = str(MiniVariables.currentDir,"/",MiniVariables.hand[2])
	var hand3 = Image.load_from_file(hand3path)
	var handtext3 = ImageTexture.new()
	handtext3.set_image(hand3)
	$%Hand3.texture_normal = handtext3
	
	var hand4path = str(MiniVariables.currentDir,"/",MiniVariables.hand[3])
	var hand4 = Image.load_from_file(hand4path)
	var handtext4 = ImageTexture.new()
	handtext4.set_image(hand4)
	$%Hand4.texture_normal = handtext4
#endregion

#func _on_load_tuber_pressed():
	#$LoadDialog.popup() # Replace with function body.
	
func _on_load_dialog_dir_selected(dir):
	MiniVariables.currentDir = dir
	$%MiniName.text = dir.replace("user://models/", "") #erases first part so only Folder name appears
	_load_Imported()
	_save_path()
	#save_settings()
	_load_model_settings()

func _on_code_rotate_pressed():
	#Rotates image in code so it doesnt look weird in Editor and Emote Menu
	emit_signal("handRotate")


func _on_no_rotate_pressed():
	emit_signal("counterRotate")


func _on_close_editor_pressed():
	self.visible = !self.visible


#region Hand Buttons
func _on_hand_1_mouse_entered():
	selectNode = $%Hand1
	selectedNode = MiniVariables.hand[0]

func _on_hand_2_mouse_entered():
	selectNode = $%Hand2
	selectedNode = MiniVariables.hand[1]

func _on_hand_3_mouse_entered():
	selectNode = $%Hand3
	selectedNode = MiniVariables.hand[2]

func _on_hand_4_mouse_entered():
	selectNode = $%Hand4
	selectedNode = MiniVariables.hand[3]
	
func _on_hand_1_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("editorSelect")
			MiniVariables.editorSelect = "H1"
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_currentTuber()
			$ImportDialog.popup()

func _on_hand_2_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("editorSelect")
			MiniVariables.editorSelect = "H2"
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_currentTuber()
			$ImportDialog.popup()
			
func _on_hand_3_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("editorSelect")
			MiniVariables.editorSelect = "H3"
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_currentTuber()
			$ImportDialog.popup()
			
func _on_hand_4_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("editorSelect")
			MiniVariables.editorSelect = "H4"
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_currentTuber()
			$ImportDialog.popup()
#endregion

#region Face Buttons
func _on_face_1_mouse_entered():
	selectNode = $%Face1
	selectedNode = MiniVariables.face[0]

func _on_face_2_mouse_entered():
	selectNode = $%Face2
	selectedNode = MiniVariables.face[1]
	
func _on_face_3_mouse_entered():
	selectNode = $%Face3
	selectedNode = MiniVariables.face[2]

func _on_face_4_mouse_entered():
	selectNode = $%Face4
	selectedNode = MiniVariables.face[3]

func _on_face_5_mouse_entered():
	selectNode = $%Face5
	selectedNode = MiniVariables.face[4]

func _on_face_6_mouse_entered():
	selectNode = $%Face6
	selectedNode = MiniVariables.face[5]

func _on_face_1_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("editorSelect")
			MiniVariables.editorSelect = "F1"
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_currentTuber()
			$ImportDialog.popup()

func _on_face_2_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("editorSelect")
			MiniVariables.editorSelect = "F2"
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_currentTuber()
			$ImportDialog.popup()
			
func _on_face_3_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("editorSelect")
			MiniVariables.editorSelect = "F3"
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_currentTuber()
			$ImportDialog.popup()
			
func _on_face_4_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("editorSelect")
			MiniVariables.editorSelect = "F4"
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_currentTuber()
			$ImportDialog.popup()
	
func _on_face_5_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("editorSelect")
			MiniVariables.editorSelect = "F5"
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_currentTuber()
			$ImportDialog.popup()
			
func _on_face_6_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("editorSelect")
			MiniVariables.editorSelect = "F6"
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_currentTuber()
			$ImportDialog.popup()
	
#endregion

func _save_path():
	MiniVariables.savePath = str(MiniVariables.currentDir,"/","ModelSettings.tres")

 #Make new ModelSettings.tres in current folder and save current variables (in Mini_Variable)
#func save_settings():
	#var data:= ModelSettings.new()
	#data.H1_Rotation_Offset = MiniVariables.H1_Rotation_Offset
	#data.H1_Counter_Rotation = MiniVariables.H1_Counter_Rotation
	#
	#data.H2_Rotation_Offset = MiniVariables.H2_Rotation_Offset
	#data.H2_Counter_Rotation = MiniVariables.H2_Counter_Rotation
	#
	#data.H3_Rotation_Offset = MiniVariables.H3_Rotation_Offset
	#data.H3_Counter_Rotation = MiniVariables.H3_Counter_Rotation
	#
	#data.H4_Rotation_Offset = MiniVariables.H4_Rotation_Offset
	#data.H4_Counter_Rotation =  MiniVariables.H4_Counter_Rotation
	#
	#var error := ResourceSaver.save(data, MiniVariables.savePath)
	#if error:
		#print("An error happened while saving data: ", error)

func _load_model_settings():
	if ResourceLoader.exists(MiniVariables.savePath):
		return load(MiniVariables.savePath)
	return null
	
#func _on_save_tuber_pressed():
	#save_settings()


