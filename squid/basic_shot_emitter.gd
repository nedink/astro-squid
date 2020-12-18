extends Node2D

export var shot_scene = preload("res://squid/BasicShot.tscn")
export var muzzle_scene = preload("res://ShotImpact.tscn")



func _physics_process(delta):
	if Input.is_action_pressed("shoot") and $CooldownTimer.is_stopped():
		# spawn bullet
		var shot = shot_scene.instance()
		shot.global_position = global_position + Vector2(randf() * 8, 0)
		shot.add_to_group("squid")
		get_tree().root.get_node("Main").add_child(shot)
		# spawn muzzle flare
		var muzzle_flare = muzzle_scene.instance()
#		muzzle_flare.global_position = global_position
		muzzle_flare.get_node("Particles2D").speed_scale = 2
		muzzle_flare.get_node("Particles2D").scale.x = 1.5
		muzzle_flare.position.x = 3
		add_child(muzzle_flare)
#		get_tree().root.get_node("Main").add_child(muzzle_flare)
		
		
		$CooldownTimer.start()

