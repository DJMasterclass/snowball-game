extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.highscore < 10:
		self.position = Vector2(5, 7)
	elif Global.highscore < 100:
		self.position = Vector2(0, 7)
	elif Global.highscore < 1000:
		self.position = Vector2(-5, 7)
	text = "Highscore: " + str(global.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
