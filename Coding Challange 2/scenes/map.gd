extends Node2D

var next_cell
var despawn_time = global.setTime
var can_generate = true

var player_spawn = false

var free_timer = 0.0
var tile_neib = [Vector2(0,0), Vector2(0,0), Vector2(0,0), Vector2(0,0)]

func _process(delta):
	free_timer += delta
	if free_timer < despawn_time:
		add_cell()
	else:
		can_generate = false
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/menu.tscn")
	
func add_cell():
	next_cell = $tiles.world_to_map($map_maker.global_position)
	#print($tiles.get_used_cells())
	$tiles.set_cellv(next_cell, 0)
	
	for tile in $tiles.get_used_cells_by_id(0):
		tile_neib = [Vector2(tile.x - 1, tile.y), Vector2(tile.x+1, tile.y), Vector2(tile.x,tile.y - 1),  Vector2(tile.x,tile.y+1)]
		for i in 4:
			var id = $tiles.get_cellv(tile_neib[i])
			var neib_id
			if id != -1:
				neib_id = $tiles.tile_set.tile_get_name(id)
			if neib_id != "ground":
				$tiles.set_cellv(tile_neib[i], 1)