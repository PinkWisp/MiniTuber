extends Node
# Dont need "class_name MiniVariables" cuz this is autoloaded
# Variables for MiniTuber and MiniEditor

var homePos = Vector2(0,0)

var currentDir = "" #Folder Directory
var savePath = "" #save file in Folder Directory

var editorSelect = ""

var face = ["face1.png","face2.png","face3.png","face4.png","face5.png","face6.png"]
var hand = ["hand1.png", "hand2.png", "hand3.png", "hand4.png"]

# Hand Settings
@export_category("Hand1 Settings")
@export_range(0, 270, 90) var H1_Rotation_Offset = 90
@export var H1_Counter_Rotation: bool = false

@export_category("Hand2 Settings")
@export_range(0, 270, 90) var H2_Rotation_Offset = 90
@export var H2_Counter_Rotation: bool = false

@export_category("Hand3 Settings")
@export_range(0, 270, 90) var H3_Rotation_Offset = 90
@export var H3_Counter_Rotation: bool = false

@export_category("Hand4 Settings")
@export_range(0, 270, 90) var H4_Rotation_Offset = 90
@export var H4_Counter_Rotation: bool = false
