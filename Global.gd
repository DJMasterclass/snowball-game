extends Node

var highscore: int = 0
const SAVE_PATH := "user://highscore.save"

func _ready():
	load_highscore()

func save_highscore():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_32(highscore)
		file.close()
	else:
		print("Failed to save highscore.")

func load_highscore():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if file:
			highscore = file.get_32()
			file.close()
		else:
			print("Failed to load highscore.")
