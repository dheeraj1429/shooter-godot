extends Node2D
class_name LavelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/items.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group('ItemContainer'):
		container.connect("spawn_item", _on_open_signal)

func _on_open_signal(pos: Vector2, _direction: Vector2):
	var item = item_scene.instantiate()
	item.position = pos
	$Items.call_deferred('add_child', item)


func _on_player_grenade_signal(pos: Vector2, player_direction: Vector2):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = player_direction * grenade.grenade_speed
	$Projectiles.add_child(grenade)
	$Ui.update_grenade_amount()


func _on_player_laser_signal(pos: Vector2, player_direction: Vector2):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(player_direction.angle()) + 90
	laser.direction = player_direction
	$Projectiles.add_child(laser)
	$Ui.update_laser_amount()
