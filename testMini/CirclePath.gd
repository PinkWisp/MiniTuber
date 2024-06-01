extends Path2D

var speed = .03
var dir := 1.0

const SIZE = 100
const NUM_POINTS = 32


func _ready() -> void:
	curve = Curve2D.new()
	for i in NUM_POINTS:
		curve.add_point(Vector2(0, -SIZE).rotated((i / float(NUM_POINTS)) * TAU))

	# End the circle.
	curve.add_point(Vector2(0, -SIZE))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible == false:
		speed = 0
	else:
		speed = .03
		
	progress_ratio += dir * speed
	if progress_ratio == 0 || progress_ratio == 1:
		dir *= -1

