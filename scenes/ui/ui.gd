extends CanvasLayer

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var laser_texture: TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label
@onready var grenade_texture: TextureRect = $GrenadeCounter/VBoxContainer/TextureRect

func _ready():
	Globals.connect("laser_amount_change", update_laser_amount)
	update_laser_amount()
	update_grenade_amount()
	
func update_label_and_texture(texture: TextureRect, amount: int, color: Color, lable: Label):
	if amount < 4:
		lable.modulate = Globals.red
		texture.modulate = Globals.red
	else:
		lable.modulate = color
		texture.modulate = color
	lable.text = str(amount)

func update_laser_amount():
	update_label_and_texture(laser_texture, Globals.laser_amount, Globals.green, laser_label)

func update_grenade_amount():
	update_label_and_texture(grenade_texture, Globals.grenade_amount, Globals.green, grenade_label)
