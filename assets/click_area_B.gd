extends Sprite2D

#ClickArea for buttons. Hide visibility or use transparent texture

@onready var _clickPolygonB: CollisionPolygon2D = $%ClickPolygonB

	
func _physics_process(_delta: float) -> void:
	_update_click_polygon()

# Creates adustable clickable area
func _update_click_polygon() -> void:
	var click_polygonB: PackedVector2Array = _clickPolygonB.polygon #turning ClickPolygon area into PackedVector2Array
	for vect_int in range(click_polygonB.size()):
		click_polygonB[vect_int] = to_global(click_polygonB[vect_int]) #Use PackedVector2Array for screen position
	get_window().mouse_passthrough_polygon = click_polygonB
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
