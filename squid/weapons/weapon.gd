extends Node2D

class_name Weapon

#var weapons = {
#	"BasicShot": [
#		preload("res://squid/weapons/BasicShot/1.tscn"), 
#		preload("res://squid/weapons/BasicShot/2.tscn")
#	],
#	"Laser": [
#		preload("res://squid/weapons/laser/1.tscn"), 
#		preload("res://squid/weapons/laser/2.tscn")
#	]
#}


func power_up(weaponType):
	# switch
	if get_child_count() == 0 or not get_child(0).weaponType == weaponType:
		if get_child_count() > 0:
			print(get_child(0).weaponType == weaponType)
		for c in get_children(): 
			c.queue_free()
		var w = load("res://squid/weapons/" + weaponType + "/1.tscn").instance()
		add_child(w)
		return
	# ++
	if get_child(0).level < 3:
		var w = load("res://squid/weapons/" + weaponType + "/" + str(get_child(0).level + 1) + ".tscn").instance()
		get_child(0).queue_free()
		add_child(w)
		move_child(w, 0)


func _physics_process(delta):
	if Input.is_action_pressed("shoot"):
		for c in get_children():
			c.shoot(delta)
	else:
		for c in get_children():
			c.no_shoot(delta)


func shoot(delta):
	pass
	
func no_shoot(delta):
	pass

