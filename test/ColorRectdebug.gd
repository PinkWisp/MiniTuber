extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_mouse_entered():
	set_color(Color.SEA_GREEN) # Replace with function body.


func _on_area_2d_mouse_exited():
	set_color(Color.RED)
