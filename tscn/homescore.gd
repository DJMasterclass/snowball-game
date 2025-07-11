extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if global.score < 10:
		self.position = Vector2(25, 40)
	elif global.score < 100:
		self.position = Vector2(20, 40)
	elif global.score < 1000:
		self.position = Vector2(15, 40)
	text = "Score: " + str(global.score)
