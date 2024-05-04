extends Node2D

@onready var chalkLine := $ChalkLine
#var chalkLine

var chalkState = false #Chalk button is off
signal toggle_off

var chalkPressed := false #not drawing

func _input(event: InputEvent): 
	if chalkState == true:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT:
				chalkPressed = event.pressed
				
				if chalkPressed:
					chalkLine = Line2D.new() #create multiple lines
					add_child(chalkLine) #create current line
					
		if Input.is_action_just_pressed("RMB"): #Chalk State off and turns cursor to normal
				for chalkLine in get_children(): #get all lines made
					chalkLine.queue_free() #delete all lines made
				chalkState = false
				toggle_off.emit()

		if event is InputEventMouseMotion && chalkPressed: #Draws lines
			chalkLine.add_point(event.position)

func _on_chalk_button_pressed():
	chalkState = true #Turns Chalk Button ON
