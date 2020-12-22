extends Node2D

class_name BasicShot

export var weaponType = "BasicShot"
export var level = 1


func shoot(delta):
	if Input.is_action_pressed("shoot") and $CooldownTimer.is_stopped():
		# spawn bullet
		for c in get_children():
			if c is BasicShotEmitter:
				var shot = preload("res://squid/weapons/BasicShot/BasicShotProjectile.tscn").instance()
				shot.global_position = c.global_position + Vector2(randf() * 10 - 4, 0)
				shot.add_to_group("squid")
				get_tree().root.get_node("Main").add_child(shot)
				# spawn muzzle flare
				var muzzle_flare = preload("res://ShotImpact.tscn").instance()
				c.add_child(muzzle_flare)
				$CooldownTimer.start()

func no_shoot(delta):
	pass
