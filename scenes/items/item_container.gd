extends CharacterBody2D
class_name ItemContainer

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)
signal spawn_item(pos: Vector2, direction: Vector2)
