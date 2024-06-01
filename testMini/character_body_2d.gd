extends CharacterBody2D

# Movement Variables
var clickPos = Vector2()
var targetPos = Vector2() 
var dashState = false

# Prep Emotes
var menuHover = false

var face = ["face1.png","face2.png","face3.png","face4.png","face5.png","face6.png"]
var hand = ["hand1.png", "hand2.png", "hand3.png", "hand4.png"]

var currentDir = "" 
var selectedFace = "" # select png from face array
var currentEmote = "" #str(currentTuber, selectedFace) # current dir and selected emote

func _ready():
	clickPos = position # Set Sprite Starter Position
	


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
	
# Emote Placeholders when making new Default
func _blank_png():
	var blank_emote1 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_emote1.save_png("user://models/default/face1.png")
	var blank_emote2 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_emote2.save_png("user://models/default/face2.png")
	var blank_emote3 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_emote3.save_png("user://models/default/face3.png")
	var blank_emote4 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_emote4.save_png("user://models/default/face4.png")
	var blank_emote5 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_emote5.save_png("user://models/default/face5.png")
	var blank_emote6 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_emote6.save_png("user://models/default/face6.png")
	var blank_hand1 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_hand1.save_png("user://models/default/hand1.png")
	var blank_hand2 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_hand2.save_png("user://models/default/hand2.png")
	var blank_hand3 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_hand3.save_png("user://models/default/hand3.png")
	var blank_hand4 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	blank_hand4.save_png("user://models/default/hand4.png")

func _change_face():
	currentEmote = str(currentDir,"/",selectedFace)

# COMPRESS AND LOAD Emote Menu Images
func _loadMenu():
	var face1 = Image.load_from_file("user://models/default/face1.png")
	var facetext1 = ImageTexture.new()
	facetext1.set_image(face1)
	$EmoteMenu/Emote1.texture = facetext1
	
	var face2 = Image.load_from_file("user://models/default/face2.png")
	var facetext2 = ImageTexture.new()
	facetext2.set_image(face2)
	$EmoteMenu/Emote2.texture = facetext2
	
	var face3 = Image.load_from_file("user://models/default/face3.png")
	var facetext3 = ImageTexture.new()
	facetext3.set_image(face3)
	$EmoteMenu/Emote3.texture = facetext3
	
	var face4 = Image.load_from_file("user://models/default/face4.png")
	var facetext4 = ImageTexture.new()
	facetext4.set_image(face4)
	$EmoteMenu/Emote4.texture = facetext4
	
	var face5 = Image.load_from_file("user://models/default/face5.png")
	var facetext5 = ImageTexture.new()
	facetext5.set_image(face5)
	$EmoteMenu/Emote5.texture = facetext5
	
	var face6 = Image.load_from_file("user://models/default/face6.png")
	var facetext6 = ImageTexture.new()
	facetext6.set_image(face6)
	$EmoteMenu/Emote6.texture = facetext6
	
func _process(delta):
	$%Orbit.look_at(get_global_mouse_position())
	
# Double Click within time limit to run
func _dash_timer():
	if $DashTimer.time_left > 0:
		dashState = true
	else:
		dashState = false
	
func _physics_process(delta):
	#LMB press punch
	#LMB hold Carry, release throw
	#MMB emote wheel
	#RMB press run to position
	#RMB hold follow mouse
	
	if InputEventMouseMotion:
		var miniDirect = get_viewport().get_mouse_position().x
		#change to scale.x?? scale needs to be 1 but flips child nodes
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
#endregion

func _input(event):
	# quick debugging
	if Input.is_action_pressed("LMB"):
		#$%WaveHand.visible = true
		$%OrbitHand.visible = true
	# Open Emote Menu
	if Input.is_action_just_pressed("MMB"):
		_loadMenu()
		$EmoteMenu.position = DisplayServer.mouse_get_position()
		$EmoteMenu.show()
		
		
#func _gui_input(event):
	#if menuHover == true:
		#print(currentTuber)
	#if Input.is_action_pressed("LMB"):
		#print(menuHover)
		#_currentTuber()
		#_compress_custom()
		#$MiniSprite.texture = load(currentEmote)
	#if Input.is_action_just_released("LMB"):
		#$EmoteMenu.show()
			
	#if Input.is_action_just_pressed("1"):
		##_compress_custom_imports()
		#$MiniSprite.texture = load(emote1)
	#if Input.is_action_just_pressed("2"):
		#$MiniSprite.texture = load(emote2)
	#if Input.is_action_just_pressed("3"):
		#$MiniSprite.texture = load(emote3)
	#if Input.is_action_just_pressed("4"):
		#$MiniSprite.texture = load(emote4)
	#if Input.is_action_just_pressed("5"):
		#$MiniSprite.texture = load(emote5)
	#if Input.is_action_just_pressed("6"):
		#$MiniSprite.texture = load(emote6)
# Extra Emotes
	#if Input.is_action_just_pressed("7"):
		#$MiniSprite.texture = load(emote7)
	#if Input.is_action_just_pressed("8"):
		#$MiniSprite.texture = load(emote8)
	#if Input.is_action_just_pressed("9"):
		#$MiniSprite.texture = load(emote9)



# Turn Imported Image into Sprite Texture
func _compress_custom():
	var image = Image.load_from_file(currentEmote)
	var texture = ImageTexture.create_from_image(image)
	$MiniSprite.texture = texture

func _on_dash_timer_timeout():
	dashState = false
	print("Rest")


#region Emote Menu
func _on_emote_1_mouse_entered():
	selectedFace = face[0]
	menuHover = true
	_change_face()
	
func _on_emote_1_mouse_exited():
	menuHover = false
	
func _on_emote_2_mouse_entered():
	selectedFace = face[1]
	menuHover = true
	_change_face()
	
func _on_emote_2_mouse_exited():
	menuHover = false
	
func _on_emote_3_mouse_entered():
	selectedFace = face[2]
	menuHover = true
	_change_face()
	
func _on_emote_3_mouse_exited():
	menuHover = false
	
func _on_emote_4_mouse_entered():
	selectedFace = face[3]
	menuHover = true
	_change_face()
	
func _on_emote_4_mouse_exited():
	menuHover = false
	
func _on_emote_5_mouse_entered():
	selectedFace = face[4]
	menuHover = true
	_change_face()
	
func _on_emote_5_mouse_exited():
	menuHover = false
	
func _on_emote_6_mouse_entered():
	selectedFace = face[5]
	menuHover = true
	_change_face()
	
func _on_emote_6_mouse_exited():
	menuHover = false
	

#endregion


func _on_emote_menu_window_input(event):
	if menuHover == true:
		print(currentEmote)
		if Input.is_action_pressed("LMB"):
			_compress_custom()
		if Input.is_action_just_released("LMB"):
			$EmoteMenu.visible = false


func _on_load_dialog_dir_selected(dir):
	currentDir = dir # Replace with function body.
