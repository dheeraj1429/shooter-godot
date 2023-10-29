extends Area2D

@export var speed: int = 2000
var direction = Vector2(0, -1)

func _ready():
	$SelftDistructTimer.start()

func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	if "hit" in body:
		body.hit()
	queue_free()


func _on_selft_distruct_timer_timeout():
	queue_free()
