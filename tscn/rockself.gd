extends MeshInstance3D


@onready var level = $"../"
var speed = 10

func _process(delta):
	position.x -= speed * delta
	if position.x < -15:
		#level.SpawnModule(position.x+(level.amnt*level.offset))
		queue_free()


func _on_area_3d_body_entered(body: Node3D) -> void:
	global.melt -= 2
	$Rock.play()
	$Hit.emitting = true
