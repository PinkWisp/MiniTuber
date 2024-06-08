@tool
extends Resource
class_name ModelSettings

@export var Current_Directory: String = "Default"
#@export var Face = ["face1.png","face2.png","face3.png","face4.png","face5.png","face6.png"]
#@export var Hand = ["hand1.png", "hand2.png", "hand3.png", "hand4.png"]

# Hand Settings
@export_category("Hand1 Settings")
@export_range(0, 270, 90) var H1_Rotation_offset
@export var H1_Counter_Rotation: bool = false

@export_category("Hand2 Settings")
@export_range(0, 270, 90) var H2_Rotation_offset
@export var H2_Counter_Rotation: bool = false

@export_category("Hand3 Settings")
@export_range(0, 270, 90) var H3_Rotation_offset
@export var H3_Counter_Rotation: bool = false

@export_category("Hand4 Settings")
@export_range(0, 270, 90) var H4_Rotation_offset
@export var H4_Counter_Rotation: bool = false

##Face Settings
#@export_category("Face1 Settings")
#@export_range(0, 270, 90) var F1_Rotation_offset
#@export var F1_Counter_Rotation: bool = false
#
#@export_category("Face2 Settings")
#@export_range(0, 270, 90) var F2_Rotation_offset
#@export var F2_Counter_Rotation: bool = false
#
#@export_category("Face3 Settings")
#@export_range(0, 270, 90) var F3_Rotation_offset
#@export var F3_Counter_Rotation: bool = false
#
#@export_category("Face4 Settings")
#@export_range(0, 270, 90) var F4_Rotation_offset
#@export var F4_Counter_Rotation: bool = false
#
#@export_category("Face5 Settings")
#@export_range(0, 270, 90) var F5_Rotation_offset
#@export var F5_Counter_Rotation: bool = false
#
#@export_category("Face6 Settings")
#@export_range(0, 270, 90) var F6_Rotation_offset
#@export var F6_Counter_Rotation: bool = false


##Mini Editor
#var currentDir = "" 
#var face = ["face1.png","face2.png","face3.png","face4.png","face5.png","face6.png"]
#var hand = ["hand1.png", "hand2.png", "hand3.png", "hand4.png"]
#
#var currentTuber = "" # use FileDialog.current_dir
#var selectedNode = "" # selected Hand/Face
#var currentEmote = "" #str(currentTuber, selectedNode) # current dir and selected Hand/Face
#var faceHover = false # Check if mouse is over Face Image
#var handHover = false # Check if mouse is over Hand Image


##MiniTuber
## Hand and Face Arrays
#var face = ["face1.png","face2.png","face3.png","face4.png","face5.png","face6.png"]
#var hand = ["hand1.png", "hand2.png", "hand3.png", "hand4.png"]
#
## Directory Variables
#var currentDir = "" 
#var selectedFace = "" #select png from face array
#var currentFace = "" #str(currentTuber, selectedFace) 
#
#var selectedHand = ""
#var currentHand = "" #str(currentTuber, selectedHand) var faceHover = false #Check if cursor is on face buttons

#var handHover = false #Check if cursor is on action buttons
#var editorON = false


