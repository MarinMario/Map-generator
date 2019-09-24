extends Control

func _process(delta):
	global.setTime = $set_time.value


func _on_Generatemap_pressed():
	get_tree().change_scene("res://scenes/map.tscn")
