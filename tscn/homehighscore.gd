extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if global.score < 10:
		self.position = Vector2(15, 20)
	elif global.score < 100:
		self.position = Vector2(10, 20)
	elif global.score < 1000:
		self.position = Vector2(5, 20)
	text = "Highscore: " + str(Global.highscore)
