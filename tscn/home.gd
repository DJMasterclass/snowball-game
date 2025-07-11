extends Control


func _on_play_pressed():
	global.countdown_enabled = true
	global.melt = 15.0
	global.score = 0.0
	global.game_on = true
	global._time()
	$click.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://tscn/main.tscn")


func _on_quit_pressed() -> void:
	$click.play()
	await get_tree().create_timer(1).timeout
	get_tree().quit()
