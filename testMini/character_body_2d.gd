extends CharacterBody2D

# Movement Variables
var clickPos = Vector2()
var targetPos = Vector2() 
var dashState = false

# Emote Variables

#have menu save over premade files
#have menu add another folder for different tubers
# Prep Emotes

var currentTuber = "" # Dynamic Directory

const emote1 = "emote1.png"
const emote2 = "emote2.png"
const emote3 = "emote3.png"
const emote4 = "emote4.png"
const emote5 = "emote5.png"
const emote6 = "emote6.png"
const hand1 = "hand1.png"
const hand2 = "hand2.png"
const hand3 = "hand3.png"
const hand4 = "hand4.png"



func _ready():
	clickPos = position

	# Make Emotes
	var dir = DirAccess.open("user://")
	if dir.dir_exists("user://models/default"):
		pass # Load Face and Hands
		$MiniSprite.texture = load(emote1)
	else:
		dir.make_dir("models")
		var dirModel = DirAccess.open("user://models")
		dirModel.make_dir("default")
		_blank_png()
		$MiniSprite.texture = load(emote1)

func _blank_png():
	emote1 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	emote1.save_png("user://models/default/emote1.png")
	emote2 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	emote2.save_png("user://models/default/emote2.png")
	emote3 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	emote3.save_png("user://models/default/emote3.png")
	emote4 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	emote4.save_png("user://models/default/emote4.png")
	emote5 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	emote5.save_png("user://models/default/emote5.png")
	emote6 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	emote6.save_png("user://models/default/emote6.png")
	hand1 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	hand1.save_png("user://models/default/hand1.png")
	hand2 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	hand2.save_png("user://models/default/hand2.png")
	hand3 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	hand3.save_png("user://models/default/hand3.png")
	hand4 = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	hand4.save_png("user://models/default/hand4.png")

	
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
	if Input.is_action_just_pressed("Close"):
		get_tree().quit()

	if Input.is_action_pressed("LMB"):
		#$%WaveHand.visible = true
		$%OrbitHand.visible = true
		
#region Emotes
	if Input.is_action_just_pressed("1"):
		$MiniSprite.texture = load(emote1)
	if Input.is_action_just_pressed("2"):
		$MiniSprite.texture = load(emote2)
	if Input.is_action_just_pressed("3"):
		$MiniSprite.texture = load(emote3)
	if Input.is_action_just_pressed("4"):
		$MiniSprite.texture = load(emote4)
	if Input.is_action_just_pressed("5"):
		$MiniSprite.texture = load(emote5)
	if Input.is_action_just_pressed("6"):
		$MiniSprite.texture = load(emote6)
# Extra Emotes
	#if Input.is_action_just_pressed("7"):
		#$MiniSprite.texture = load(emote7)
	#if Input.is_action_just_pressed("8"):
		#$MiniSprite.texture = load(emote8)
	#if Input.is_action_just_pressed("9"):
		#$MiniSprite.texture = load(emote9)
#endregion

func _on_dash_timer_timeout():
	dashState = false
	print("Rest")
