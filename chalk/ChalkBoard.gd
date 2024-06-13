extends Node2D

@onready var chalkLine := $ChalkLine #parent

var chalk = load("res://assets/chalk.png")

var chalkPressed := false #not drawing

func _input(event: InputEvent): 
	if GlobalVar.chalkState == true:
		Input.set_custom_mouse_cursor(chalk)
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT:
				chalkPressed = event.pressed
				
				if chalkPressed:
					chalkLine = Line2D.new() #create multiple lines
					add_child(chalkLine) #create current line
					
		if Input.is_action_just_pressed("Clear Chalk"): #Chalk State off and turns cursor to normal
				for chalkLine in get_children(): #get all lines made
					chalkLine.queue_free() #delete all lines made
				GlobalVar.chalkState = false
				Input.set_custom_mouse_cursor(null)
				$%ChalkButton.button_pressed = false
				
		if event is InputEventMouseMotion && chalkPressed: #Draws lines
			chalkLine.add_point(event.position)
			
	#if GlobalVar.chalkState == false:
		#for chalkLine in get_children(): #get all lines made
			#chalkLine.queue_free() #delete all lines made
		#Input.set_custom_mouse_cursor(null)
		
func _process(_delta):
	pass

func _on_chalk_button_toggled(toggled_on):
	if toggled_on:
		GlobalVar.chalkState = true
		Input.set_custom_mouse_cursor(chalk)
		DisplayServer.window_set_mouse_passthrough(GlobalVar.transBG)
	else:
		GlobalVar.chalkState = false
		Input.set_custom_mouse_cursor(null)
		DisplayServer.window_set_mouse_passthrough(GlobalVar.buttonMenu)
