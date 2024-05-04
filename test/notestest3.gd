extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.window_set_mouse_passthrough($Polygon2D.polygon)
	#DisplayServer.window_set_mouse_passthrough($%TestClick.polygon)
	pass

func set_passthrough(ClickArea2: Sprite2D):
	var texture_center: Vector2 = ClickArea2.texture.get_size() / 2 # Center
	var texture_corners: PackedVector2Array = [
	ClickArea2.global_position + texture_center * Vector2(-1, -1), # Top left corner
	ClickArea2.global_position + texture_center * Vector2(1, -1), # Top right corner
	ClickArea2.global_position + texture_center * Vector2(1 , 1), # Bottom right corner
	ClickArea2.global_position + texture_center * Vector2(-1 ,1) # Bottom left corner
	]
	DisplayServer.window_set_mouse_passthrough(texture_corners)
	print("Vector Moved?")

#func _input(event):
	#if event.is_action_released("LMB"):
		#set_passthrough($%ClickArea2)
	#if event.is_action_pressed("LMB"):
		#if event is InputEventMouseButton:
			#$ColorRect.set_color(Color.MEDIUM_PURPLE)
		#if event.is_released():
			#$ColorRect.set_color(Color.CORNFLOWER_BLUE)
			#set_passthrough($%ClickArea2)
			#DisplayServer.window_set_mouse_passthrough($Polygon2D.polygon)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

#func _on_area_2d_input_event(viewport, event, shape_idx):
	#if event.is_action_released("LMB"):
		#set_passthrough($%ClickArea2) # Replace with function body.
		#$ColorRect.set_color(Color.CORNFLOWER_BLUE)



func _on_pass_move_pressed():
	set_passthrough($%ClickArea2) 
