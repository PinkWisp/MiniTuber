extends Control
#file location gets cleared somehow?? need to move later

var prevNoteDir = ""
var currentNoteDir = ""

var notesDir = ""
var infoDir = ""
var otherDir = ""

var txtDir = ["Notes.txt","Info.txt","Other.txt"]

# Add Folder for exporting
func _ready():
	var customization_settings = ConfigHandler.load_customization_settings()
	var dir = DirAccess.open("user://")
	if dir.dir_exists(customization_settings.notebook_dir):
		currentNoteDir = customization_settings.notebook_dir
		_load_notes()
		
	# Checks if default or another folder is selected
	# if not make default folder, files, and selecet it for start up
	else:
		dir.make_dir("notebooks")
		var dirNotes = DirAccess.open("user://notebooks")
		dirNotes.make_dir("default")
		currentNoteDir = "user://notebooks/default"
		var defaultDir =  DirAccess.open("user://notebooks/default/")
		save_notes()
		ConfigHandler.save_customization_settings("notebook_dir", currentNoteDir)
		$%FileDialog.root_subfolder = "user://notebooks/"
		print("Notebook start up completed.")
	$%NoteMove.text = currentNoteDir.replace("user://notebooks/", "")
	if %NoteMove.text == "default":
		%NoteMove.text = "Notebook"


func _find_fileDir():
	notesDir = str(currentNoteDir,"/",txtDir[0])
	infoDir = str(currentNoteDir,"/",txtDir[1])
	otherDir = str(currentNoteDir,"/",txtDir[2])

func save_notes():
	_find_fileDir()
	var noteFile = FileAccess.open(notesDir, FileAccess.WRITE)
	noteFile.store_string($%NoteEdit.text)
	var infoFile = FileAccess.open(infoDir, FileAccess.WRITE)
	infoFile.store_string($%InfoEdit.text)
	var otherFile = FileAccess.open(otherDir, FileAccess.WRITE)
	otherFile.store_string($%OtherEdit.text)
	print("Saved: ", currentNoteDir)
		
		
func _on_file_dialog_dir_selected(dir):
	currentNoteDir = dir
	_load_notes()
	$%NoteMove.text = currentNoteDir.replace("user://notebooks/", "")
	if %NoteMove.text == "default":
		%NoteMove.text = "Notebook"
	

	
func _load_notes():
	print("Loading Current Directory: ", currentNoteDir)
	_find_fileDir()
	if FileAccess.file_exists(notesDir):
		var noteFile = FileAccess.open(notesDir, FileAccess.READ_WRITE)
		$%NoteEdit.text = noteFile.get_as_text()
		print("Notes Loaded")
	else:
		var noteFile = FileAccess.open(notesDir, FileAccess.WRITE)
		noteFile.store_string($%NoteEdit.text)
		$%NoteEdit.text = noteFile.get_as_text()
		print("Not Found. New File made in ", notesDir)
		
	if FileAccess.file_exists(infoDir):
		var infoFile = FileAccess.open(infoDir, FileAccess.READ_WRITE)
		$%InfoEdit.text = infoFile.get_as_text()
		print("Info Loaded")
	else:
		var infoFile = FileAccess.open(infoDir, FileAccess.WRITE)
		infoFile.store_string($%InfoEdit.text)
		$%InfoEdit.text = infoFile.get_as_text()
		print("Not Found. New File made in ", infoDir)
		
	if FileAccess.file_exists(otherDir):
		var otherFile = FileAccess.open(otherDir, FileAccess.READ_WRITE)
		$%OtherEdit.text = otherFile.get_as_text()
		print("Others Loaded")
	else:
		var otherFile = FileAccess.open(otherDir, FileAccess.WRITE)
		otherFile.store_string($%OtherEdit.text)
		$%InfoEdit.text = otherFile.get_as_text()
		print("Not Found. New File made in ", otherDir)
	
	print("Previous directory Finished.")


func _on_close_note_pressed():
	save_notes()


func _on_note_book_selecting_folder():
	save_notes() 



func _on_save_button_pressed():
	save_notes()
