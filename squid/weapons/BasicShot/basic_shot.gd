extends Node2D

class_name BasicShot

export var weaponType = "BasicShot"
export var level = 1
export var speed_scale = 1.0

func shoot(delta):
	if $CooldownTimer.is_stopped():
		$AudioStreamPlayer.volume_db = -5
		$AudioStreamPlayer.play()
		# spawn bullet
		for c in get_children():
			if c is BasicShotEmitter:
				var shot = preload("res://squid/weapons/BasicShot/BasicShotProjectile.tscn").instance()
				shot.global_position = c.global_position + Vector2(randf() * 10 - 4, 0).rotated(rotation)
				shot.global_rotation = global_rotation
				shot.speed *= speed_scale
				print(shot.speed)
				if get_parent().is_in_group("squid"):
					shot.add_to_group("squid")
				get_tree().root.get_node("Main").add_child(shot)
				# spawn muzzle flare
				var muzzle_flare = preload("res://ShotImpact.tscn").instance()
				c.add_child(muzzle_flare)
				$CooldownTimer.start()

func no_shoot(delta):
	pass
