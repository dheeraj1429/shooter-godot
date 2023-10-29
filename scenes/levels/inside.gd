extends LavelParent

func _on_gate_player_entered_gate_signal(_body):
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(.8, .8), .6)
	tween.tween_property($Player, 'move_speed', 0, 0.5)

func _on_gate_player_exit_gate_signal(_body):
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, 'zoom', Vector2(.6, .6), .6)
