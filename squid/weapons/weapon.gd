extends Node2D

class_name Weapon


var weapons = {
	"BasicShot": [
		load("res://squid/weapons/basic_shot/1.tscn"), 
		load("res://squid/weapons/basic_shot/2.tscn")
	],
	"Laser": [
		load("res://squid/weapons/laser/1.tscn"), 
		load("res://squid/weapons/laser/2.tscn")
	]
}

export (String) var weapon setget set_weapon
#export (PackedScene) var weapon_scene setget set_weapon

func _ready():
	set_weapon("BasicShot")


func _physics_process(delta):
	if Input.is_action_pressed("shoot"):
		for c in get_children():
			if c.has_method("shoot"):
				c.shoot(delta)
	else:
		for c in get_children():
			if c.has_method("no_shoot"):
				c.no_shoot(delta)


func shoot(delta):
	pass
	
func no_shoot(delta):
	pass

func set_weapon(type):
	weapon = type
	print(type)
	# remove 
#	remove_child(get_child(0))
	# replace
#	var w = weapon_scene.instance()
#	add_child(w)

func upgrade_weapon(w):
	if w == weapon:
		
#		level += 1
#		set_weapon(weapons.get(weapon_scene.get_class())[level])
		# upgrade
		pass
	else:
		# switch
		pass
		
	# remove child if not instance of 
	
