extends PathFollow2D

var speed = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if visible == false:
		#speed = 0
	#else:
		#speed = 3
		
	if Input.is_action_pressed("Action"):
		progress_ratio += delta * speed
	if Input.is_action_just_released("Action"):
		progress_ratio = 0

