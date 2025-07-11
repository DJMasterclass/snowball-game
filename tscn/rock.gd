extends Node3D

@export var rock_scene: PackedScene
@export var lane_positions: Array[Vector3] = [
	Vector3(50, 0.5, -3), # Left lane
	Vector3(50, 0.5, 0),  # Middle lane
	Vector3(50, 0.5, 3)   # Right lane
]
@export var spawn_interval := randi_range(1, 2)
var rng = RandomNumberGenerator.new()
var spawn_timer := 0.0

func _process(delta):
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_timer = spawn_interval
		spawn_snowman()

func spawn_snowman():
	if rock_scene:
		var rock = rock_scene.instantiate()
		var lane_index = randi() % lane_positions.size()
		rock.global_position = global_transform.origin + lane_positions[lane_index]
		get_parent().add_child(rock)
		rock.rotation_degrees.y = 180
		rock.scale = Vector3(0.7, 0.7, 0.7)
