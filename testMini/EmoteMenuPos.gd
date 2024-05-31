extends Node2D

func _input(event):
	if Input.is_action_just_pressed("MMB"):
		var MMBClick = DisplayServer.mouse_get_position()
		var eMenu = $%EmoteMenu
		$EmoteMenuPos.position = MMBClick
		print($EmoteMenuPos.position)
		#$%EmoteMenu.popup(Rect2i(MMBClick.x, MMBClick.y, eMenu.rect_size.x, eMenu.rect_size.y))
