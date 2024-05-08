extends Control
#file location gets cleared somehow?? need to move later

var noteState = false

# Add Folder for exporting
func _ready():
	var dir = DirAccess.open("user://")
	#var dir_notes = "user://notebook/"
	if dir.dir_exists("user://notebook/"):
		var noteFile = FileAccess.open("user://notebook/Notes.txt", FileAccess.READ)
		$%NoteEdit.text = noteFile.get_as_text()
		var infoFile = FileAccess.open("user://notebook/Info.txt", FileAccess.READ)
		$%InfoEdit.text = infoFile.get_as_text()
		var otherFile = FileAccess.open("user://notebook/Other.txt", FileAccess.READ)
		$%OtherEdit.text = otherFile.get_as_text()
	else:
		dir.make_dir("notebook")
		save_notes()

func save_notes():
	var noteFile = FileAccess.open("user://notebook/Notes.txt", FileAccess.WRITE)
	noteFile.store_string($%NoteEdit.text)
	var infoFile = FileAccess.open("user://notebook/Info.txt", FileAccess.WRITE)
	infoFile.store_string($%InfoEdit.text)
	var otherFile = FileAccess.open("user://notebook/Other.txt", FileAccess.WRITE)
	otherFile.store_string($%OtherEdit.text)

func _on_save_pressed():
	save_notes()

func _on_close_note_pressed():
	save_notes()
	visible = false
	DisplayServer.window_set_mouse_passthrough($%ButtonArea.polygon)
	print("NoteClose")
	noteState = false

func _on_notes_pressed():
	visible = true
