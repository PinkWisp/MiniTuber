extends Control

var emoteHover = false # Check if mouse is over EmoteSprite

@export var selectNode: TextureRect # Select TextureRect on hover

var dir = DirAccess.open("user://")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().files_dropped.connect(_on_files_dropped) # Replace with function body.


#region Image Drag and Drop Load
# Check Drag Hover position & get node
func _hover_check(node: Control):
	var mousePos = get_global_mouse_position()
	if mousePos.x < node.global_position.x \
			or mousePos.x > node.global_position.x + node.size.x \
			or mousePos.y < node.global_position.y \
			or mousePos.y > node.global_position.y + node.size.y:
		return false
	return true

func _on_files_dropped(files):
	if _hover_check(selectNode):
		
		var path = files [0]
		
		var emote = Image.new()
		emote.load(path)
		
		var emote_sprite = ImageTexture.new()
		emote_sprite.set_image(emote)
		
		selectNode.texture = emote_sprite
#endregion

#region File Dialog Face & Hands
func _on_file_dialog_file_selected(path):
	var emote = Image.new()
	emote.load(path)
	
	var emote_sprite = ImageTexture.new()
	emote_sprite.set_image(emote)
	
	selectNode.texture = emote_sprite
	_custom_save()

#endregion
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	# quick debugging
	if Input.is_action_just_pressed("Close"):
		get_tree().quit()
		
func _gui_input(event):
	if emoteHover == true:
		if Input.is_action_just_pressed("RMB"):
			$FileDialog.popup()

func _emotestate():
	emoteHover = !emoteHover
	


#region Emote Hover
func _on_emote_1_mouse_entered():
	emoteHover = true
	selectNode = $%Emote1
	
func _on_emote_1_mouse_exited():
	emoteHover = false

func _on_emote_2_mouse_entered():
	emoteHover = true
	selectNode = $%Emote2
	
func _on_emote_2_mouse_exited():
	emoteHover = false

func _on_emote_3_mouse_entered():
	emoteHover = true
	selectNode = $%Emote3

func _on_emote_3_mouse_exited():
	emoteHover = false

func _on_emote_4_mouse_entered():
	emoteHover = true
	selectNode = $%Emote4

func _on_emote_4_mouse_exited():
	emoteHover = false

func _on_emote_5_mouse_entered():
	emoteHover = true
	selectNode = $%Emote5

func _on_emote_5_mouse_exited():
	emoteHover = false

func _on_emote_6_mouse_entered():
	emoteHover = true
	selectNode = $%Emote6

func _on_emote_6_mouse_exited():
	emoteHover = false
#endregion

#region Hand Hover
func _on_hand_1_mouse_entered():
	emoteHover = true
	selectNode = $%Hand1


func _on_hand_1_mouse_exited():
	emoteHover = false


func _on_hand_2_mouse_entered():
	emoteHover = true
	selectNode = $%Hand2


func _on_hand_2_mouse_exited():
	emoteHover = false


func _on_hand_3_mouse_entered():
	emoteHover = true
	selectNode = $%Hand3


func _on_hand_3_mouse_exited():
	emoteHover = false


func _on_hand_4_mouse_entered():
	emoteHover = true
	selectNode = $%Hand4


func _on_hand_4_mouse_exited():
	emoteHover = false

#endregion

func _custom_save():
	emote1.save_png("user://models/default/emote1.png")
	emote2.save_png("user://models/default/emote2.png")
	emote3.save_png("user://models/default/emote3.png")
	emote4.save_png("user://models/default/emote4.png")
	emote5.save_png("user://models/default/emote5.png")
	emote6.save_png("user://models/default/emote6.png")
	hand1.save_png("user://models/default/hand1.png")
	hand2.save_png("user://models/default/hand2.png")
	hand3.save_png("user://models/default/hand3.png")
	hand4.save_png("user://models/default/hand4.png")

func _on_file_dialog_close_requested():
	_custom_save() 



func _on_emote_1_item_rect_changed():
	pass # Replace with function body.
