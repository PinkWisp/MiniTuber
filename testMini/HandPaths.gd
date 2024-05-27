extends PathFollow2D

var speed = .03
var dir := 1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible == false:
		speed = 0
	else:
		speed = .03
	
	progress_ratio += dir * speed
	if progress_ratio == 0 || progress_ratio == 1:
		dir *= -1
