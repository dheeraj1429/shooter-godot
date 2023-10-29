extends RigidBody2D

const grenade_speed = 750

func explode():
	$AnimationPlayer.play("Explosion")
