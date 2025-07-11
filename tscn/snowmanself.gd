extends MeshInstance3D


@onready var level = $"../"
var speed = 10

func _process(delta):
	position.x -= speed * delta
	if position.x < -15:
		queue_free()


func _on_area_3d_body_entered(body: Node3D) -> void:
	global.melt += 5
	self.visible = false
	$Snow.play()
	await get_tree().create_timer(0.5).timeout
	queue_free()
