extends Control

var emoteHover = false # Check if mouse is over EmoteSprite

@export var selectNode: TextureRect # Select TextureRect on hover

var currentTuber = "" # use FileDialog.current_dir
var selectNodePath = "" # selected emote
var currentEmote = "" #str(currentTuber, selectNodePath) # current dir and selected emote

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().files_dropped.connect(_on_files_dropped) # Replace with function body.
	$LoadDialog.popup()


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
		emote_sprite.save_png(emote)
		
		
		selectNode.texture = emote_sprite
#endregion

#region File Dialog Face & Hands
func _on_file_dialog_file_selected(path):
	var emote = Image.new()
	emote.load(path)
	emote.save_png(currentEmote)
	
	var emote_sprite = ImageTexture.new()
	emote_sprite.set_image(emote)

	selectNode.texture = emote_sprite

#endregion
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	# quick debugging
	if Input.is_action_just_pressed("Close"):
		self.visible = !self.visible
		
func _gui_input(event):
	if emoteHover == true:
		if Input.is_action_just_pressed("RMB"):
			_currentTuber()
			$ImportDialog.popup()
		if Input.is_action_just_pressed("LMB"):
			_currentTuber()
			print(currentEmote)
			

func _emotestate():
	emoteHover = !emoteHover
	

func _currentTuber():
	currentEmote = str(currentTuber,selectNodePath)


#region Emote Hover
func _on_emote_1_mouse_entered():
	emoteHover = true
	selectNode = $%Emote1
	selectNodePath = "/emote1.png"
	
func _on_emote_1_mouse_exited():
	emoteHover = false

func _on_emote_2_mouse_entered():
	emoteHover = true
	selectNode = $%Emote2
	selectNodePath = "/emote2.png"
	
func _on_emote_2_mouse_exited():
	emoteHover = false

func _on_emote_3_mouse_entered():
	emoteHover = true
	selectNode = $%Emote3
	selectNodePath = "/emote3.png"

func _on_emote_3_mouse_exited():
	emoteHover = false

func _on_emote_4_mouse_entered():
	emoteHover = true
	selectNode = $%Emote4
	selectNodePath = "/emote4.png"

func _on_emote_4_mouse_exited():
	emoteHover = false

func _on_emote_5_mouse_entered():
	emoteHover = true
	selectNode = $%Emote5
	selectNodePath = "/emote5.png"

func _on_emote_5_mouse_exited():
	emoteHover = false

func _on_emote_6_mouse_entered():
	emoteHover = true
	selectNode = $%Emote6
	selectNodePath = "/emote6.png"

func _on_emote_6_mouse_exited():
	emoteHover = false
#endregion

#region Hand Hover
func _on_hand_1_mouse_entered():
	emoteHover = true
	selectNode = $%Hand1
	selectNodePath = "/hand1.png"

func _on_hand_1_mouse_exited():
	emoteHover = false


func _on_hand_2_mouse_entered():
	emoteHover = true
	selectNode = $%Hand2
	selectNodePath = "/hand2.png"


func _on_hand_2_mouse_exited():
	emoteHover = false


func _on_hand_3_mouse_entered():
	emoteHover = true
	selectNode = $%Hand3
	selectNodePath = "/hand3.png"


func _on_hand_3_mouse_exited():
	emoteHover = false


func _on_hand_4_mouse_entered():
	emoteHover = true
	selectNode = $%Hand4
	selectNodePath = "/hand4.png"


func _on_hand_4_mouse_exited():
	emoteHover = false

#endregion

func _refresh_customs():
	pass

func _on_load_tuber_pressed():
	$LoadDialog.popup() # Replace with function body.
	
	
func _on_load_dialog_dir_selected(dir):
	currentTuber = dir
	print(dir)
