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
	if %NoteMove.text == "Notebook Name":
		%NoteMove.text = "Notebook"
	
	var dir = DirAccess.open("user://")
	if dir.dir_exists("user://notebooks/default/"):
		var noteFile = FileAccess.open("user://notebooks/default/Notes.txt", FileAccess.READ)
		$%NoteEdit.text = noteFile.get_as_text()
		var infoFile = FileAccess.open("user://notebooks/default/Info.txt", FileAccess.READ)
		$%InfoEdit.text = infoFile.get_as_text()
		var otherFile = FileAccess.open("user://notebooks/default/Other.txt", FileAccess.READ)
		$%OtherEdit.text = otherFile.get_as_text()
	else:
		dir.make_dir("notebooks")
		var dirNotes = DirAccess.open("user://notebooks")
		dirNotes.make_dir("default")
		currentNoteDir = "user://notebooks/default/"
		save_notes()

func _find_fileDir():
	notesDir = str(currentNoteDir,"/",txtDir[0])
	infoDir = str(currentNoteDir,"/",txtDir[1])
	otherDir = str(currentNoteDir,"/",txtDir[2])
	print("Found Files")

func save_notes():
	_find_fileDir()
	var noteFile = FileAccess.open(notesDir, FileAccess.WRITE)
	noteFile.store_string($%NoteEdit.text)
	var infoFile = FileAccess.open(infoDir, FileAccess.WRITE)
	infoFile.store_string($%InfoEdit.text)
	var otherFile = FileAccess.open(otherDir, FileAccess.WRITE)
	otherFile.store_string($%OtherEdit.text)
		
		
		
func _on_file_dialog_dir_selected(dir):
	currentNoteDir = dir
	print(currentNoteDir)
	_load_notes()
	$%NoteMove.text = currentNoteDir.replace("user://notebooks/", "")
	
func _load_notes():
	_find_fileDir()
	var loadDir = DirAccess.open(currentNoteDir)
	
	if loadDir.dir_exists(notesDir):
		var noteFile = FileAccess.open(notesDir, FileAccess.READ)
		$%NoteEdit.text = noteFile.get_as_text()
	else:
		var noteFile = FileAccess.open(notesDir, FileAccess.WRITE)
		noteFile.store_string($%NoteEdit.text)
		
	if loadDir.dir_exists(infoDir):
		var infoFile = FileAccess.open(infoDir, FileAccess.READ)
		$%InfoEdit.text = infoFile.get_as_text()
	else:
		var infoFile = FileAccess.open(infoDir, FileAccess.WRITE)
		infoFile.store_string($%InfoEdit.text)
		
	if loadDir.dir_exists(otherDir):
		var otherFile = FileAccess.open(otherDir, FileAccess.READ)
		$%OtherEdit.text = otherFile.get_as_text()
	else:
		var otherFile = FileAccess.open(otherDir, FileAccess.WRITE)
		otherFile.store_string($%OtherEdit.text)
