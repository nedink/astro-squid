extends Weapon

class_name BasicShot

export var level = 1

var shot_scene = preload("res://squid/weapons/basic_shot/BasicShotProjectile.tscn")
var muzzle_scene = preload("res://ShotImpact.tscn")

func shoot(delta):
	if Input.is_action_pressed("shoot") and $CooldownTimer.is_stopped():
		# spawn bullet
		var shot = shot_scene.instance()
		shot.global_position = global_position + Vector2(randf() * 10 - 4, 0)
		shot.add_to_group("squid")
		get_tree().root.get_node("Main").add_child(shot)
		# spawn muzzle flare
		var muzzle_flare = muzzle_scene.instance()
		add_child(muzzle_flare)
		$CooldownTimer.start()

func no_shoot(delta):
	pass
