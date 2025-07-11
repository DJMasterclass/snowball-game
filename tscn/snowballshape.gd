extends Node3D

var divmel = global.melt/100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	divmel = global.melt/10.0
	var target_scale = Vector3(divmel, divmel, divmel)
	self.scale = self.scale.lerp(target_scale, 5 * delta)
#position.z = lerpf(position.z, positions[curPos],delta*30)
