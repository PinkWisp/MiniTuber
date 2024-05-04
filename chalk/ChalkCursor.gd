extends Node

var chalk = load("res://assets/chalk.png")

func _on_chalk_button_pressed():
	# This is similar to changing it in the project settings.
	Input.set_custom_mouse_cursor(chalk)

func _on_chalk_board_toggle_off():
	Input.set_custom_mouse_cursor(null)
