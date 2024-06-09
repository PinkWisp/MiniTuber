extends Resource
class_name ModelSettings
#Format for Saving

@export var Current_Directory: String = ""

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
