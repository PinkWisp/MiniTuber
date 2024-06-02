extends CharacterBody2D

# Movement Variables
var clickPos = Vector2()
var targetPos = Vector2() 
var dashState = false

var faceHover = false #Check if cursor is on face buttons
var actionHover = false #Check if cursor is on action buttons

# Hand and Face Arrays
var face = ["face1.png","face2.png","face3.png","face4.png","face5.png","face6.png"]
var hand = ["hand1.png", "hand2.png", "hand3.png", "hand4.png"]
#var action = ["action1", "action2", "action3", "action4"]

# Directory Variables
var currentDir = "" 
var selectedFace = "" #select png from face array
var currentFace = "" #str(currentTuber, selectedFace) # current dir and selected Face
# Hand + Path = Action
@export var selectAction: Sprite2D # preselect action in Menu
@export var selectedAction = Sprite2D #plays selected action

func _ready():
	clickPos = position #Set Sprite Starter Position
	selectedAction = $%OrbitHand
	

#region # Make Default Folder and Placeholders
	var dir = DirAccess.open("user://")
	if dir.dir_exists("user://models/default"):
		var dirModel = DirAccess.open("user://models/default")
		var image = Image.load_from_file("user://models/default/face1.png")
		var texture = ImageTexture.create_from_image(image)
		$MiniSprite.texture = texture
		_loadMenu()
	else:
		dir.make_dir("models")
		var dirModel = DirAccess.open("user://models")
		dirModel.make_dir("default")
		_blank_png()
		var image = Image.load_from_file("user://models/default/face1.png")
		var texture = ImageTexture.create_from_image(image)
		$MiniSprite.texture = texture
#endregion
	
# Face Placeholders when making new Default
func _blank_png():
	var blank_Face1 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_Face1.save_png("user://models/default/face1.png")
	var blank_Face2 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_Face2.save_png("user://models/default/face2.png")
	var blank_Face3 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_Face3.save_png("user://models/default/face3.png")
	var blank_Face4 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_Face4.save_png("user://models/default/face4.png")
	var blank_Face5 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_Face5.save_png("user://models/default/face5.png")
	var blank_Face6 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_Face6.save_png("user://models/default/face6.png")
	var blank_hand1 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_hand1.save_png("user://models/default/hand1.png")
	var blank_hand2 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_hand2.save_png("user://models/default/hand2.png")
	var blank_hand3 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_hand3.save_png("user://models/default/hand3.png")
	var blank_hand4 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_hand4.save_png("user://models/default/hand4.png")

# Get dir path to face.png for compress
func _change_face():
	currentFace = str(currentDir,"/",selectedFace)

# COMPRESS AND LOAD Face Menu Images
func _loadMenu():
#region Face
	var face1 = Image.load_from_file("user://models/default/face1.png")
	var facetext1 = ImageTexture.new()
	facetext1.set_image(face1)
	$%Face1.texture = facetext1
	
	var face2 = Image.load_from_file("user://models/default/face2.png")
	var facetext2 = ImageTexture.new()
	facetext2.set_image(face2)
	$%Face2.texture = facetext2
	
	var face3 = Image.load_from_file("user://models/default/face3.png")
	var facetext3 = ImageTexture.new()
	facetext3.set_image(face3)
	$%Face3.texture = facetext3
	
	var face4 = Image.load_from_file("user://models/default/face4.png")
	var facetext4 = ImageTexture.new()
	facetext4.set_image(face4)
	$%Face4.texture = facetext4
	
	var face5 = Image.load_from_file("user://models/default/face5.png")
	var facetext5 = ImageTexture.new()
	facetext5.set_image(face5)
	$%Face5.texture = facetext5
	
	var face6 = Image.load_from_file("user://models/default/face6.png")
	var facetext6 = ImageTexture.new()
	facetext6.set_image(face6)
	$%Face6.texture = facetext6
#endregion
#region Hands
	var hand1 = Image.load_from_file("user://models/default/hand1.png")
	var handtext1 = ImageTexture.new()
	handtext1.set_image(hand1)
	$%Action1.texture = handtext1
	
	var hand2 = Image.load_from_file("user://models/default/hand2.png")
	var handtext2 = ImageTexture.new()
	handtext2.set_image(hand2)
	$%Action2.texture = handtext2
	
	var hand3 = Image.load_from_file("user://models/default/hand3.png")
	var handtext3 = ImageTexture.new()
	handtext3.set_image(hand3)
	$%Action3.texture = handtext3
	
	var hand4 = Image.load_from_file("user://models/default/hand4.png")
	var handtext4 = ImageTexture.new()
	handtext4.set_image(hand4)
	$%Action4.texture = handtext4
#endregion
	
func _process(delta):
	$%Orbit.look_at(get_global_mouse_position())
	
# Double Click within time limit to run
func _dash_timer():
	if $DashTimer.time_left > 0:
		dashState = true
	else:
		dashState = false
	
func _physics_process(delta):
	# LMB press punch
	# LMB hold Carry, release throw
	# MMB Face wheel
	# RMB press run to position
	# RMB hold follow mouse
	
	if InputEventMouseMotion:
		var miniDirect = get_viewport().get_mouse_position().x
		# change to scale.x?? scale needs to be 1 but flips child nodes
		if miniDirect > position.x:
			$MiniSprite.flip_h = true
		else:
			$MiniSprite.flip_h = false
	
#region Movement
	if Input.is_action_just_released("RMB"):
		$DashTimer.start()
	
	if dashState == false:
		if Input.is_action_pressed("RMB"):
			_dash_timer()
			clickPos = (get_global_mouse_position() - global_position)
			if clickPos.length() > 100:
				clickPos = clickPos.normalized() * 500
			velocity = clickPos
			move_and_slide()
			print(dashState)

	if dashState == true:
		if Input.is_action_just_pressed("RMB"):
			_dash_timer()
			$DashTimer.paused = true
			clickPos = get_global_mouse_position()
			
		if position.distance_to(clickPos) > 100:
			targetPos = (clickPos - global_position).normalized()
			velocity = targetPos * 2000
			move_and_slide()
			print("Target:", targetPos, '\n', "Pos:", position,'\n', "ClickPOS:", clickPos)
		
		if position.distance_to(clickPos) < 100:
			$DashTimer.paused = false

func _input(event):
	# Action
	if Input.is_action_pressed("LMB"):
		if selectedAction.visible == false:
			selectedAction.visible = true
	if Input.is_action_pressed("WheelDown"):
		selectedAction.visible = false
		
		
	# Open Face Menu. Can't use popup due to Rendering ordering bug with Always Ontop main window
	if Input.is_action_just_pressed("MMB"):
		_loadMenu()
		var menuPos = DisplayServer.mouse_get_position()
		$Menu.position = Vector2i(menuPos.x-165,menuPos.y)
		$Menu.show()
		if selectedAction.visible == true:
			selectedAction.visible = false

# Confirms Face / Turn Imported Image into Sprite Texture
func _compress_custom():
	var image = Image.load_from_file(currentFace)
	var texture = ImageTexture.create_from_image(image)
	$MiniSprite.texture = texture
	
# Confirm Action selction in Menu 
func _selectedAction():
	selectedAction = selectAction

func _on_dash_timer_timeout():
	dashState = false
	print("Rest")


#region Face Menu
func _on_face_1_mouse_entered():
	selectedFace = face[0]
	faceHover = true
	_change_face()
	
func _on_face_1_mouse_exited():
	faceHover = false
	
func _on_face_2_mouse_entered():
	selectedFace = face[1]
	faceHover = true
	_change_face()
	
func _on_face_2_mouse_exited():
	faceHover = false
	
func _on_face_3_mouse_entered():
	selectedFace = face[2]
	faceHover = true
	_change_face()
	
func _on_face_3_mouse_exited():
	faceHover = false
	
func _on_face_4_mouse_entered():
	selectedFace = face[3]
	faceHover = true
	_change_face()
	
func _on_face_4_mouse_exited():
	faceHover = false
	
func _on_face_5_mouse_entered():
	selectedFace = face[4]
	faceHover = true
	_change_face()
	
func _on_face_5_mouse_exited():
	faceHover = false
	
func _on_face_6_mouse_entered():
	selectedFace = face[5]
	faceHover = true
	_change_face()
	
func _on_face_6_mouse_exited():
	faceHover = false
#endregion

#region Hand Menu
func _on_action_1_mouse_entered():
	selectAction = %WaveHand
	actionHover = true
	
func _on_action_1_mouse_exited():
	actionHover = false
	
func _on_action_2_mouse_entered():
	selectAction = %OrbitHand
	actionHover = true
	
func _on_action_2_mouse_exited():
	actionHover = false
	
func _on_action_3_mouse_entered():
	selectAction = %VerticalHand
	actionHover = true
	
func _on_action_3_mouse_exited():
	actionHover = false
	
func _on_action_4_mouse_entered():
	selectAction = %HoritonalHand
	actionHover = true
	
func _on_action_4_mouse_exited():
	actionHover = false
#endregion

func _on_face_menu_window_input(event):
	if faceHover == true:
		print(currentFace)
		if Input.is_action_pressed("LMB"):
			_compress_custom()
		if Input.is_action_just_released("LMB"):
			$Menu.visible = false
	if actionHover == true:
		print(actionHover)
		if Input.is_action_pressed("LMB"):
			_selectedAction()
		if Input.is_action_just_released("LMB"):
			$Menu.visible = false

func _on_load_dialog_dir_selected(dir):
	currentDir = dir # Replace with function body.
