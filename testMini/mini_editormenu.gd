extends Control

var faceHover = false # Check if mouse is over Face Image
var handHover = false # Check if mouse is over Hand Image

@export var selectNode: TextureRect # Select TextureRect on hover

var currentTuber = "" # use FileDialog.current_dir
var selectedNode = "" # selected Hand/Face
var currentEmote = "" #str(currentTuber, selectedNode) # current dir and selected Hand/Face

signal handRotate
signal counterRotate

# Called when the node enters the scene tree for the first time.
func _ready():
	_load_Imported()

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
	var face1 = Image.load_from_file("user://models/default/face1.png")
	var facetext1 = ImageTexture.new()
	facetext1.set_image(face1)
	$%Emote1.texture = facetext1
	
	var face2 = Image.load_from_file("user://models/default/face2.png")
	var facetext2 = ImageTexture.new()
	facetext2.set_image(face2)
	$%Emote2.texture = facetext2
	
	var face3 = Image.load_from_file("user://models/default/face3.png")
	var facetext3 = ImageTexture.new()
	facetext3.set_image(face3)
	$%Emote3.texture = facetext3
	
	var face4 = Image.load_from_file("user://models/default/face4.png")
	var facetext4 = ImageTexture.new()
	facetext4.set_image(face4)
	$%Emote4.texture = facetext4
	
	var face5 = Image.load_from_file("user://models/default/face5.png")
	var facetext5 = ImageTexture.new()
	facetext5.set_image(face5)
	$%Emote5.texture = facetext5
	
	var face6 = Image.load_from_file("user://models/default/face6.png")
	var facetext6 = ImageTexture.new()
	facetext6.set_image(face6)
	$%Emote6.texture = facetext6
#endregion
#region Hand
	var hand1 = Image.load_from_file("user://models/default/hand1.png")
	var handtext1 = ImageTexture.new()
	handtext1.set_image(hand1)
	$%Hand1.texture = handtext1
	
	var hand2 = Image.load_from_file("user://models/default/hand2.png")
	var handtext2 = ImageTexture.new()
	handtext2.set_image(hand2)
	$%Hand2.texture = handtext2
	
	var hand3 = Image.load_from_file("user://models/default/hand3.png")
	var handtext3 = ImageTexture.new()
	handtext3.set_image(hand3)
	$%Hand3.texture = handtext3
	
	var hand4 = Image.load_from_file("user://models/default/hand4.png")
	var handtext4 = ImageTexture.new()
	handtext4.set_image(hand4)
	$%Hand4.texture = handtext4
#endregion

#region Emote Hover
func _on_emote_1_mouse_entered():
	faceHover = true
	selectNode = $%Emote1
	selectedNode = "face1.png"
	
func _on_emote_1_mouse_exited():
	faceHover = false

func _on_emote_2_mouse_entered():
	faceHover = true
	selectNode = $%Emote2
	selectedNode = "face2.png"
	
func _on_emote_2_mouse_exited():
	faceHover = false

func _on_emote_3_mouse_entered():
	faceHover = true
	selectNode = $%Emote3
	selectedNode = "face3.png"

func _on_emote_3_mouse_exited():
	faceHover = false

func _on_emote_4_mouse_entered():
	faceHover = true
	selectNode = $%Emote4
	selectedNode = "face4.png"

func _on_emote_4_mouse_exited():
	faceHover = false

func _on_emote_5_mouse_entered():
	faceHover = true
	selectNode = $%Emote5
	selectedNode = "face5.png"

func _on_emote_5_mouse_exited():
	faceHover = false

func _on_emote_6_mouse_entered():
	faceHover = true
	selectNode = $%Emote6
	selectedNode = "face6.png"

func _on_emote_6_mouse_exited():
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
	print(dir)

func _on_code_rotate_pressed():
	emit_signal("handRotate")


func _on_no_rotate_pressed():
	emit_signal("counterRotate")


func _on_close_editor_pressed():
	self.visible = !self.visible
