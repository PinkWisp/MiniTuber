extends Control
#file location gets cleared somehow?? need to move later

var noteState = false

# Add Folder for exporting
#func _ready():
	#var noteFile = FileAccess.open("res://usernotes/Notes.txt", FileAccess.READ)
	#$%NoteEdit.text = noteFile.get_as_text()
	#var infoFile = FileAccess.open("res://usernotes/Info.txt", FileAccess.READ)
	#$%InfoEdit.text = infoFile.get_as_text()
	#var otherFile = FileAccess.open("res://usernotes/Other.txt", FileAccess.READ)
	#$%OtherEdit.text = otherFile.get_as_text()
#
#func _on_save_txt_2_pressed():
	#var noteFile = FileAccess.open("res://usernotes/Notes.txt", FileAccess.WRITE)
	#noteFile.store_string($%NoteEdit.text)
	#var infoFile = FileAccess.open("res://usernotes/Info.txt", FileAccess.WRITE)
	#infoFile.store_string($%InfoEdit.text)
	#var otherFile = FileAccess.open("res://usernotes/Other.txt", FileAccess.WRITE)
	#otherFile.store_string($%OtherEdit.text)
	#
func _on_close_note_pressed():
	#var noteFile = FileAccess.open("res://usernotes/Notes.txt", FileAccess.WRITE)
	#noteFile.store_string($%NoteEdit.text)
	#var infoFile = FileAccess.open("res://usernotes/Info.txt", FileAccess.WRITE)
	#infoFile.store_string($%InfoEdit.text)
	#var otherFile = FileAccess.open("res://usernotes/Other.txt", FileAccess.WRITE)
	#otherFile.store_string($%OtherEdit.text)
	visible = false
	DisplayServer.window_set_mouse_passthrough($%ButtonArea.polygon)
	print("NoteClose")
	noteState = false

func _on_notes_pressed():
	visible = true
