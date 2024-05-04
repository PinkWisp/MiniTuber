extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_chalk_pressed():
	set_color(Color.WHITE)
	print("White")


func _on_note_pad_pressed():
	set_color(Color.PALE_GREEN)
	print("Pale Green")

func _on_mini_tuber_pressed():
	set_color(Color.MEDIUM_PURPLE)
	print("Medium Purple")

func _on_settings_pressed():
	set_color(Color.ORANGE)
	print("Orange")
