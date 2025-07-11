extends Node3D

@export var modules: Array[PackedScene] = []
var amnt = 15
var rng = RandomNumberGenerator.new()
var offset = 8

var initObs = 9

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in amnt:
		SpawnModule(n*offset)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass

func SpawnModule(n):
	if initObs > 10:
		rng.randomize()
		var num = rng.randi_range(0,modules.size()-1)
		var instance = modules[num].instantiate()
		instance.position.x = n
		add_child(instance)
	else:
		var instance = modules[0].instantiate()
		instance.position.x = n
		add_child(instance)
		initObs += 1
