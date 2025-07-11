extends Node3D

@export var snowman_scene: PackedScene
@export var lane_positions: Array[Vector3] = [
	Vector3(55, 0.5, -3), # Left lane
	Vector3(55, 0.5, 0),  # Middle lane
	Vector3(55, 0.5, 3)   # Right lane
]
@export var spawn_interval := randi_range(4, 10)
var rng = RandomNumberGenerator.new()
var spawn_timer := 0.0

func _process(delta):
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_timer = spawn_interval
		spawn_snowman()

func spawn_snowman():
	if snowman_scene:
		var snowman = snowman_scene.instantiate()
		var lane_index = randi() % lane_positions.size()
		snowman.global_position = global_transform.origin + lane_positions[lane_index]
		get_parent().add_child(snowman)
		snowman.rotation_degrees.y = 180
		snowman.scale = Vector3(0.7, 0.7, 0.7)
