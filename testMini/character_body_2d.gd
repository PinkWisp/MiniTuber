extends CharacterBody2D

# Movement Variables
var clickPos = Vector2()
var targetPos = Vector2() 
var dashState = false

# Emote Variables
var emote1 = "res://assets/EmoteTest/pispSMUG.png"
var emote2 = "res://assets/EmoteTest/pispYELL.png"
var emote3 = "res://assets/EmoteTest/pispCRY.png"
var emote4 = "res://assets/EmoteTest/disbeliefplaceholder.png"
var emote5 = "res://assets/EmoteTest/poutplaceholder.png"
var emote6 = "res://assets/EmoteTest/angryplaceholder.png"
# Extra Emote
#var emote7
#var emote8
#var emote9

func _ready():
	clickPos = position
	
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
			$MiniPlaceholder.flip_h = true
		else:
			$MiniPlaceholder.flip_h = false
	
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
		#$%HandTemp.visible = true
		$%CircleTemp.visible = true
		
#region Emotes
	if Input.is_action_just_pressed("1"):
		$MiniPlaceholder.texture = load(emote1)
	if Input.is_action_just_pressed("2"):
		$MiniPlaceholder.texture = load(emote2)
	if Input.is_action_just_pressed("3"):
		$MiniPlaceholder.texture = load(emote3)
	if Input.is_action_just_pressed("4"):
		$MiniPlaceholder.texture = load(emote4)
	if Input.is_action_just_pressed("5"):
		$MiniPlaceholder.texture = load(emote5)
	if Input.is_action_just_pressed("6"):
		$MiniPlaceholder.texture = load(emote6)
# Extra Emotes
	#if Input.is_action_just_pressed("7"):
		#$MiniPlaceholder.texture = load(emote7)
	#if Input.is_action_just_pressed("8"):
		#$MiniPlaceholder.texture = load(emote8)
	#if Input.is_action_just_pressed("9"):
		#$MiniPlaceholder.texture = load(emote9)
#endregion

func _on_dash_timer_timeout():
	dashState = false
	print("Rest")


func _on_popup_menu_close_requested():
	$PopupMenu.visible = false
