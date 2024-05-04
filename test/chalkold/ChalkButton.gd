extends Button

var startPosition
var buttonHighlighted
var chalkTween = create_tween()

# Called when the node enters the scene tree for the first time.
func _ready():
	startPosition = get_screen_position() # Replace with function body.

func _on_mouse_entered():
	chalkTween.tween_property()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
