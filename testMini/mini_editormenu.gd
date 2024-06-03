extends Control

var faceHover = false # Check if mouse is over Face Image
var handHover = false # Check if mouse is over Hand Image

@export var selectNode: TextureRect # Select TextureRect on hover

# Dynamic path for loading 
var currentDir = "" 
var face = ["face1.png","face2.png","face3.png","face4.png","face5.png","face6.png"]
var hand = ["hand1.png", "hand2.png", "hand3.png", "hand4.png"]

var currentTuber = "" # use FileDialog.current_dir
var selectedNode = "" # selected Hand/Face
var currentEmote = "" #str(currentTuber, selectedNode) # current dir and selected Hand/Face

signal handRotate
signal counterRotate

# Called when the node enters the scene tree for the first time.
func _ready():
	#_load_Imported() # moved to LoadDiag cuz thats where we get currentDir.
	pass

#region File Dialog Face & Hands
func _on_file_dialog_file_selected(path):
	var emote = Image.new()
	emote.load(path)
	emote.save_png(currentEmote)
	
	var emote_sprite = ImageTexture.new()
	emote_sprite.set_image(emote)

	selectNode.texture = emote_sprite
#endregion

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	# quick debugging
	if Input.is_action_just_pressed("Close"):
		self.visible = !self.visible
		
func _gui_input(event):
	if faceHover == true:
		if Input.is_action_just_pressed("RMB"):
			_currentTuber()
			$ImportDialog.popup()
		if Input.is_action_just_pressed("LMB"):
			_currentTuber()
			print(currentEmote)
	if handHover == true:
		if Input.is_action_just_pressed("RMB"):
			_currentTuber()
			$ImportDialog.popup()
		if Input.is_action_just_pressed("LMB"):
			_currentTuber()
			print(currentEmote)
			
func _currentTuber():
	currentEmote = str(currentTuber, "/", selectedNode)

func _load_Imported():
#region Face
	var face1path = str(currentDir,"/",face[0])
	var face1 = Image.load_from_file(face1path)
	var facetext1 = ImageTexture.new()
	facetext1.set_image(face1)
	$%Face1.texture = facetext1
	
	var face2path = str(currentDir,"/",face[1])
	var face2 = Image.load_from_file(face2path)
	var facetext2 = ImageTexture.new()
	facetext2.set_image(face2)
	$%Face2.texture = facetext2
	
	var face3path = str(currentDir,"/",face[2])
	var face3 = Image.load_from_file(face3path)
	var facetext3 = ImageTexture.new()
	facetext3.set_image(face3)
	$%Face3.texture = facetext3
	
	var face4path = str(currentDir,"/",face[3])
	var face4 = Image.load_from_file(face4path)
	var facetext4 = ImageTexture.new()
	facetext4.set_image(face4)
	$%Face4.texture = facetext4
	
	var face5path = str(currentDir,"/",face[4])
	var face5 = Image.load_from_file(face5path)
	var facetext5 = ImageTexture.new()
	facetext5.set_image(face5)
	$%Face5.texture = facetext5
	
	var face6path = str(currentDir,"/",face[5])
	var face6 = Image.load_from_file(face6path)
	var facetext6 = ImageTexture.new()
	facetext6.set_image(face6)
	$%Face6.texture = facetext6
#endregion
#region Hands
	var hand1path = str(currentDir,"/",hand[0])
	var hand1 = Image.load_from_file(hand1path)
	var handtext1 = ImageTexture.new()
	handtext1.set_image(hand1)
	$%Hand1.texture = handtext1
	
	var hand2path = str(currentDir,"/",hand[1])
	var hand2 = Image.load_from_file(hand2path)
	var handtext2 = ImageTexture.new()
	handtext2.set_image(hand2)
	$%Hand2.texture = handtext2
	
	var hand3path = str(currentDir,"/",hand[2])
	var hand3 = Image.load_from_file(hand3path)
	var handtext3 = ImageTexture.new()
	handtext3.set_image(hand3)
	$%Hand3.texture = handtext3
	
	var hand4path = str(currentDir,"/",hand[3])
	var hand4 = Image.load_from_file(hand4path)
	var handtext4 = ImageTexture.new()
	handtext4.set_image(hand4)
	$%Hand4.texture = handtext4
#endregion

#region Emote Hover
func _on_face_1_mouse_entered():
	faceHover = true
	selectNode = $%Face1
	selectedNode = "face1.png"
	
func _on_face_1_mouse_exited():
	faceHover = false

func _on_face_2_mouse_entered():
	faceHover = true
	selectNode = $%Face2
	selectedNode = "face2.png"
	
func _on_face_2_mouse_exited():
	faceHover = false

func _on_face_3_mouse_entered():
	faceHover = true
	selectNode = $%Face3
	selectedNode = "face3.png"

func _on_face_3_mouse_exited():
	faceHover = false

func _on_face_4_mouse_entered():
	faceHover = true
	selectNode = $%Face4
	selectedNode = "face4.png"

func _on_face_4_mouse_exited():
	faceHover = false

func _on_face_5_mouse_entered():
	faceHover = true
	selectNode = $%Face5
	selectedNode = "face5.png"

func _on_face_5_mouse_exited():
	faceHover = false

func _on_face_6_mouse_entered():
	faceHover = true
	selectNode = $%Face6
	selectedNode = "face6.png"

func _on_face_6_mouse_exited():
	faceHover = false
#endregion

#region Hand Hover
func _on_hand_1_mouse_entered():
	handHover = true
	selectNode = $%Hand1
	selectedNode = "hand1.png"

func _on_hand_1_mouse_exited():
	handHover = false


func _on_hand_2_mouse_entered():
	handHover = true
	selectNode = $%Hand2
	selectedNode = "hand2.png"


func _on_hand_2_mouse_exited():
	handHover = false


func _on_hand_3_mouse_entered():
	handHover = true
	selectNode = $%Hand3
	selectedNode = "hand3.png"


func _on_hand_3_mouse_exited():
	handHover = false


func _on_hand_4_mouse_entered():
	handHover = true
	selectNode = $%Hand4
	selectedNode = "hand4.png"


func _on_hand_4_mouse_exited():
	handHover = false

#endregion

func _on_load_tuber_pressed():
	$LoadDialog.popup() # Replace with function body.
	
	
func _on_load_dialog_dir_selected(dir):
	currentTuber = dir
	currentDir = dir
	$%MiniName.text = dir.replace("user://models/", "") #erases first part so only Folder name appears
	_load_Imported()
	print(dir)

func _on_code_rotate_pressed():
	emit_signal("handRotate")


func _on_no_rotate_pressed():
	emit_signal("counterRotate")


func _on_close_editor_pressed():
	self.visible = !self.visible
