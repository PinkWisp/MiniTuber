extends Sprite2D

@onready var _clickPolygon: CollisionPolygon2D = $%ClickPolygon

	
func _physics_process(_delta: float) -> void:
	_update_click_polygon()

# Creates adustable clickable area
func _update_click_polygon() -> void:
	var click_polygon: PackedVector2Array = _clickPolygon.polygon #turning ClickPolygon area into PackedVector2Array
	for vect_int in range(click_polygon.size()):
		click_polygon[vect_int] = to_global(click_polygon[vect_int]) #Use PackedVector2Array for screen position
