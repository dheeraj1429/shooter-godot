extends StaticBody2D

signal player_entered_gate_signal(body)
signal player_exit_gate_signal(body)

func _on_area_2d_body_entered(body):
	player_entered_gate_signal.emit(body)


func _on_area_2d_body_exited(body):
	player_exit_gate_signal.emit(body)
