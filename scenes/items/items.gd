extends Area2D


func _on_body_entered(body):
	body.add_item()
	queue_free()
