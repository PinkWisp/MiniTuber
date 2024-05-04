extends Node2D

@onready var chalkLine := $ChalkLine #ready variables

var chalkState = false #Chalk button is off
signal toggle_off

var chalkPressed := false #not drawing
var currentLine: Line2D

func _input(event: InputEvent): 
	if chalkState == true:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT:
				chalkPressed = event.pressed
				
				if chalkPressed:
					currentLine = Line2D.new() #create new Line2D
					chalkLine.add_sibling(currentLine) #create multiple Line2D
					
			if event.button_index == MOUSE_BUTTON_RIGHT: #Chalf State off and turns cursor to normal
				#chalkState = false
				#toggle_off.emit()
				queue_free()
				#currentLine.clear_points()
				
		if event is InputEventMouseMotion && chalkPressed: #Draws lines
			currentLine.add_point(event.position)

func _on_chalk_button_pressed():
	chalkState = true #Turns Chalk Button ON
