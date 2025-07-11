extends CharacterBody3D

var positions = [-3,0,3]
var curPos = 1

var swipeLength = 10
var startSwipe: Vector2
var curSwipe: Vector2
var swiping = false
var divmel = global.melt / 100.0
var in_shadow = false

var threshold = 20
var swipeDir = 0

const JUMP_VEl = 4
var fall = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var death_sensor = $DeathSensor
@onready var Shadow_sensor = $Shadowsensor

func _process(delta):
	_swipe()
	if swipeDir == 1 or Input.is_action_just_pressed("right"):#this is the proble
		if curPos < 2 or Input.is_action_just_pressed("right"):#instead of checking for curPos
			curPos += 1
			swipeDir = 0
	elif swipeDir == -1 or Input.is_action_just_pressed("left"):#its just detecting the arrow keys
		if curPos > 0 or Input.is_action_just_pressed("left"):#change this so it changes curPos then it will work
			curPos -= 1
			swipeDir = 0
	else:
		Input.vibrate_handheld()
	position.z = lerpf(position.z, positions[curPos],delta*30)
	if death_sensor.is_colliding():
		get_parent().get_node("Dead").emitting = true
		self.visible = false
		await get_tree().create_timer(0.5).timeout
		death()
	velocity.y -= fall*delta
	
	if Shadow_sensor.is_colliding():
		in_shadow = true
		global.countdown_enabled = false
		darken_snowball()
	else:
		in_shadow = false
		global.countdown_enabled = true
		lighten_snowball()
	move_and_slide()
	if global.melt == 0:
		death()




func _swipe():
	if Input.is_action_just_pressed("press"):
		if !swiping:
			swiping = true
			startSwipe = get_viewport().get_mouse_position()
	if Input.is_action_just_released("press") or Input.is_action_just_pressed("up"):
		curSwipe = get_viewport().get_mouse_position()
		if startSwipe.distance_to(curSwipe) >= swipeLength or Input.is_action_just_pressed("up"):
			if abs(startSwipe.y-curSwipe.y) < threshold:
				if startSwipe.x-curSwipe.x < 0:
					swipeDir = 1
				else:
					swipeDir = -1
			if abs(startSwipe.x-curSwipe.x) < threshold or Input.is_action_just_pressed("up"):
				if startSwipe.y-curSwipe.y > 0 and is_on_floor() or Input.is_action_just_pressed("up") and is_on_floor():
					velocity.y = JUMP_VEl
			swiping = false
	else:
		swiping = false


func death():
	global.game_on = false
	global.countdown_enabled = false
	if is_inside_tree():
		get_tree().change_scene_to_file("res://tscn/home.tscn")
	if global.score > Global.highscore:
		Global.highscore = global.score
		Global.save_highscore()

func darken_snowball():
	var mesh: MeshInstance3D = $Node3D/Snowballshape  # Adjust the path to your mesh
	var material: StandardMaterial3D = mesh.get_active_material(0)
	if material is StandardMaterial3D:
		var new_color: Color = material.albedo_color.darkened(0.01)
		material.albedo_color = new_color

func lighten_snowball():
	var mesh: MeshInstance3D = $Node3D/Snowballshape  # Adjust the path to your mesh
	var material: StandardMaterial3D = mesh.get_active_material(0)
	if material is StandardMaterial3D:
		var new_color: Color = material.albedo_color.lightened(0.01)
		material.albedo_color = new_color
