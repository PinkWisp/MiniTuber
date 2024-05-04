extends CharacterBody2D

var draggingDistance
var dir
var dragging
var newPosition = Vector2()

var mouse_in = false

func _ready():
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() && mouse_in:
			draggingDistance = position.distance_to(get_viewport().get_mouse_position())
			dir = (get_viewport().get_mouse_position() - position).normalized()
			dragging = true
			newPosition = get_viewport().get_mouse_position() - draggingDistance * dir
		else:
			dragging = false
			
	elif event is InputEventMouseMotion:
		if dragging:
			newPosition = get_viewport().get_mouse_position() - draggingDistance * dir


func _physics_process(delta):
	if dragging:
		velocity = (newPosition - position) * Vector2(30, 30)
		move_and_slide()
	
 # Set these two functions through the Area2D Signals!!
func _on_area_2d_mouse_entered():
	mouse_in = true
	print("Mouse In")


func _on_area_2d_mouse_exited():
		mouse_in = false
		print("Mouse Out")



func _on_button_pressed():
	visible = true # Replace with function body.
