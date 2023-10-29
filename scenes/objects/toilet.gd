extends ItemContainer

func hit():
	var spawnMarkerItem =  $SpawnPositions.get_child(randi()%$SpawnPositions.get_child_count()) as Marker2D
	spawn_item.emit(spawnMarkerItem.global_position, current_direction)
