extends CharacterBody2D

# Movement Variables
var clickPos = Vector2()
var targetPos = Vector2() 
var dashState = false

var counterRotation = false #Hand rotates against pivoit to stay pointed in a direction
var prevRotation #Rotation before CounterRotation is true


var selectedFace = "" 
var currentFace = "" #str(currentTuber, selectedFace) 

var selectedHand = ""
var currentHand = "" #str(currentTuber, selectedHand) 

func _ready():
	clickPos = position #Set Sprite Starter Position
	prevRotation = %OrbitHand.rotation
#region # Make Default Folder and Placeholders
	var dir = DirAccess.open("user://")
	# make another check for model thats already in use
	if dir.dir_exists("user://models/default"):
		var dirModel = DirAccess.open("user://models/default")
		# Loads first face
		var image = Image.load_from_file("user://models/default/face1.png")
		var texture = ImageTexture.create_from_image(image)
		$MiniSprite.texture = texture
		#_loadMenu() # moved to LoadDiag cuz thats where we get currentDir.
	# Makes folder and blank .png for first start up
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

# Get dir path to face.png to convert
func _change_face():
	currentFace = str(MiniVariables.currentDir ,"/",selectedFace)
	
# Get dir path to hand.png to convert
func _change_hand():
	currentHand = str(MiniVariables.currentDir,"/",selectedHand)

# COMPRESS AND LOAD Face Menu Images
func _load_menu():
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
	
func _process(delta):
	$%Orbit.look_at(get_global_mouse_position()) #rotates Orbit node with mouse position

	
# Double Click within time limit to run
func _dash_timer():
	if GlobalVar.miniState == true:
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
	if GlobalVar.miniState == true:
		if InputEventMouseMotion:
			var miniDirect = get_viewport().get_mouse_position().x
			# change to scale.x?? scale needs to be 1 but flips child nodes
			if miniDirect > position.x:
				$MiniSprite.flip_h = true
			else:
				$MiniSprite.flip_h = false
				
		#Hand rotates against pivoit to stay pointed in a direction
		if counterRotation == true:
			$%OrbitHand.global_rotation = !%Orbit.rotation
			

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

		if dashState == true:
			if Input.is_action_just_pressed("RMB"):
				_dash_timer()
				$DashTimer.paused = true
				clickPos = get_global_mouse_position()
				
			if position.distance_to(clickPos) > 100:
				targetPos = (clickPos - global_position).normalized()
				velocity = targetPos * 2000
				move_and_slide()
			
			if position.distance_to(clickPos) < 100:
				$DashTimer.paused = false

func _input(event):
	# Action
	if GlobalVar.miniState == true:
		if Input.is_action_pressed("LMB"):
			if %OrbitHand.visible == false: #Check if Hand is visible
				%OrbitHand.visible = true
		if Input.is_action_pressed("WheelDown"): #Hide hand
			%OrbitHand.visible = false

		# Open Face Menu. Can't use popup due to Rendering ordering bug with Always Ontop main window
		if Input.is_action_just_pressed("MMB"):
			_load_menu()
			_load_model_settings()
			var menuPos = DisplayServer.mouse_get_position()
			$Menu.position = Vector2i(menuPos.x-165,menuPos.y)
			$Menu.show()

# Confirms Face / Turn Imported Image into Sprite Texture
func _convert_facetexture():
	var image = Image.load_from_file(currentFace)
	var texture = ImageTexture.create_from_image(image)
	$MiniSprite.texture = texture
	
# Confirms Hand / Turn Imported Image into Sprite Texture
func _convert_handtexture():
	var image = Image.load_from_file(currentHand)
	var texture = ImageTexture.create_from_image(image)
	%OrbitHand.texture = texture

func _on_dash_timer_timeout():
	dashState = false


#region Hands Buttons
func _on_hand_1_mouse_entered():
	selectedHand = MiniVariables.hand[0]

func _on_hand_1_pressed():
	_change_hand()
	_convert_handtexture()
	$Menu.visible = false
	$%OrbitHand.rotation_degrees = MiniVariables.H1_Rotation_Offset
	counterRotation = MiniVariables.H1_Counter_Rotation

func _on_hand_2_mouse_entered():
	selectedHand = MiniVariables.hand[1]
	
func _on_hand_2_pressed():
	_change_hand()
	_convert_handtexture()
	$Menu.visible = false
	$%OrbitHand.rotation_degrees = MiniVariables.H2_Rotation_Offset
	counterRotation = MiniVariables.H2_Counter_Rotation

func _on_hand_3_mouse_entered():
	selectedHand = MiniVariables.hand[2]
	
func _on_hand_3_pressed():
	_change_hand()
	_convert_handtexture()
	$Menu.visible = false
	$%OrbitHand.rotation_degrees = MiniVariables.H3_Rotation_Offset
	counterRotation = MiniVariables.H3_Counter_Rotation

func _on_hand_4_mouse_entered():
	selectedHand = MiniVariables.hand[3]
	
func _on_hand_4_pressed():
	_change_hand()
	_convert_handtexture()
	$Menu.visible = false
	$%OrbitHand.rotation_degrees = MiniVariables.H4_Rotation_Offset
	counterRotation = MiniVariables.H4_Counter_Rotation

#endregion

#region Face Buttons
func _on_face_1_mouse_entered():
	selectedFace = MiniVariables.face[0]

func _on_face_1_pressed():
	_change_face()
	_convert_facetexture()
	$Menu.visible = false

func _on_face_2_mouse_entered():
	selectedFace = MiniVariables.face[1]

func _on_face_2_pressed():
	_change_face()
	_convert_facetexture()
	$Menu.visible = false

func _on_face_3_mouse_entered():
	selectedFace = MiniVariables.face[2]

func _on_face_3_pressed():
	_change_face()
	_convert_facetexture()
	$Menu.visible = false

func _on_face_4_mouse_entered():
	selectedFace = MiniVariables.face[3]

func _on_face_4_pressed():
	_change_face()
	_convert_facetexture()
	$Menu.visible = false

func _on_face_5_mouse_entered():
	selectedFace = MiniVariables.face[4]

func _on_face_5_pressed():
	_change_face()
	_convert_facetexture()
	$Menu.visible = false

func _on_face_6_mouse_entered():
	selectedFace = MiniVariables.face[5]

func _on_face_6_pressed():
	_change_face()
	_convert_facetexture()
	$Menu.visible = false
#endregion

func _on_mini_editor_hand_rotate():
	$%OrbitHand.rotation_degrees += 90
	if $%OrbitHand.rotation_degrees >= 360:
		$%OrbitHand.rotation_degrees = 0
		
	if MiniVariables.editorSelect == "H1":
		MiniVariables.H1_Rotation_Offset = $%OrbitHand.rotation_degrees
		
	if MiniVariables.editorSelect == "H2":
		MiniVariables.H3_Rotation_Offset = $%OrbitHand.rotation_degrees
		
	if MiniVariables.editorSelect == "H3":
		MiniVariables.H3_Rotation_Offset = $%OrbitHand.rotation_degrees
		
	if MiniVariables.editorSelect == "H4":
		MiniVariables.H4_Rotation_Offset = $%OrbitHand.rotation_degrees

func _on_mini_editor_counter_rotate():
	counterRotation = !counterRotation
	if counterRotation == false: #gets previous rotation from _ready and reapplies
		$%OrbitHand.rotation = prevRotation
		
	if MiniVariables.editorSelect == "H1":
		MiniVariables.H1_Counter_Rotation = counterRotation
		
	if MiniVariables.editorSelect == "H2":
		MiniVariables.H2_Counter_Rotation = counterRotation
		
	if MiniVariables.editorSelect == "H3":
		MiniVariables.H3_Counter_Rotation = counterRotation
		
	if MiniVariables.editorSelect == "H4":
		MiniVariables.H4_Counter_Rotation = counterRotation

func _load_model_settings():
	if ResourceLoader.exists(MiniVariables.savePath):
		return load(MiniVariables.savePath)
	return null

# if Handx is selected in Editor then change mini's hand and load settings
func _on_mini_editor_editor_select():
	if MiniVariables.editorSelect == "H1":
		_on_hand_1_mouse_entered() #Gets path for .png
		_on_hand_1_pressed() #Change image
		$%OrbitHand.rotation_degrees = MiniVariables.H1_Rotation_Offset #Load settings
		counterRotation = MiniVariables.H1_Counter_Rotation
	if MiniVariables.editorSelect == "H2":
		_on_hand_2_mouse_entered()
		_on_hand_2_pressed()
		$%OrbitHand.rotation_degrees = MiniVariables.H2_Rotation_Offset
		counterRotation = MiniVariables.H2_Counter_Rotation
	if MiniVariables.editorSelect == "H3":
		_on_hand_3_mouse_entered()
		_on_hand_3_pressed()
		$%OrbitHand.rotation_degrees = MiniVariables.H3_Rotation_Offset
		counterRotation = MiniVariables.H3_Counter_Rotation
	if MiniVariables.editorSelect == "H4":
		_on_hand_4_mouse_entered()
		_on_hand_4_pressed()
		$%OrbitHand.rotation_degrees = MiniVariables.H4_Rotation_Offset
		counterRotation = MiniVariables.H4_Counter_Rotation


	if MiniVariables.editorSelect == "F2":
		_on_face_1_mouse_entered()
		_on_face_1_pressed()
	if MiniVariables.editorSelect == "F2":
		_on_face_2_mouse_entered()
		_on_face_2_pressed()
	if MiniVariables.editorSelect == "F3":
		_on_face_3_mouse_entered()
		_on_face_3_pressed()
	if MiniVariables.editorSelect == "F4":
		_on_face_4_mouse_entered()
		_on_face_4_pressed()
	if MiniVariables.editorSelect == "F5":
		_on_face_5_mouse_entered()
		_on_face_5_pressed()
	if MiniVariables.editorSelect == "F6":
		_on_face_6_mouse_entered()
		_on_face_6_pressed()


func _on_mini_editor_load_dialog():
	_load_menu()
	_load_model_settings()



func _on_mini_tuber_toggled(toggled_on):
	GlobalVar.miniState = true 
	DisplayServer.window_set_mouse_passthrough(GlobalVar.transBG)
