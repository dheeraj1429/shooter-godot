extends CharacterBody2D
 
@export var max_speed: int = 300
var move_speed: int = max_speed
var can_laser: bool = true
var can_grenade: bool = true

# signals
signal laser_signal(pos: Vector2, player_direction: Vector2)
signal grenade_signal(pos: Vector2, player_direction: Vector2)


func _process(_delta):
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	velocity = direction * move_speed
	move_and_slide()
	
	# player rotation movements
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	# player shooting action
	if Input.is_action_pressed('primary_action') and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		var laser_markers = $LaserStatePositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		$GPUParticles2D.emitting = true
		$LaserReloadTimer.start()
		can_laser = false
		laser_signal.emit(selected_laser.global_position, player_direction)
	
	# player throw grenade action
	if Input.is_action_pressed('secondary_action') and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		var grenade_markers = $LaserStatePositions.get_children()[0]
		$GPUParticles2D.emitting = true
		$GrenadeReloadTimer.start()
		can_grenade = false
		grenade_signal.emit(grenade_markers.global_position, player_direction)
		

func add_item():
	Globals.laser_amount += 5

func _on_timer_timeout():
	can_laser = true


func _on_grenade_reload_timer_timeout():
	can_grenade = true
