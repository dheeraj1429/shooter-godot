extends Node

signal laser_amount_change

# player variables
var laser_amount: int = 20:
	set(value):
		laser_amount = value
		laser_amount_change.emit()

var grenade_amount: int = 20:
	set(value):
		grenade_amount = value

# colors
const green: Color = Color('2d8e28')
const red: Color = Color('f60915')
