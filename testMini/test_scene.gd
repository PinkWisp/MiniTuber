extends Node

signal loadDialog

# Called when the node enters the scene tree for the first time.
func _ready():
	$LoadDialog.popup()

func _input(event):
	# quick debugging
	if Input.is_action_just_pressed("ForceClose"):
		get_tree().quit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
