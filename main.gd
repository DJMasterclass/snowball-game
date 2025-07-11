extends Node3D

@onready var snowball = $Snowball
@onready var dead_particles = $Dead


var melt = 15.0
var countdown_enabled = false
var score = 0
var game_on = false


func _time():
	if game_on:
		await get_tree().create_timer(0.5).timeout
		if countdown_enabled:
			melt -= 1.0
		score += 1
		_time()

func _process(delta):
	if snowball and dead_particles:
		dead_particles.global_position = snowball.global_position
		dead_particles.scale = snowball.scale
