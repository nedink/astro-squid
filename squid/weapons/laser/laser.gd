extends Weapon

class_name Laser


func _ready():
	if is_in_group("squid"):
		for e in get_children():
			e.collision_mask = 2
	if is_in_group("others"):
		for e in get_children():
			e.collision_mask = 1


func shoot(delta):
	show()
	print("shooting")
	if Input.is_action_pressed("shoot"):
		# laser
		for e in get_children():
			# cast to end of screen
			
			$"1/Label".text = str(get_viewport_rect())
#			e.cast_to = Vector2(512 - e.position.x, 0)
#			$"1/Label".text = str("no colliding")
			if e.is_colliding():
				
				e.get_node("Emission").set_point_position(1, Vector2(to_local(e.get_collision_point()).x, 0))
				e.get_node("ImpactFlare").position = Vector2(to_local(e.get_collision_point()).x, 0)
				e.get_node("ImpactFlare").show()
#				points = [Vector2(), Vector2(to_local(e.get_collision_point()).x, 0)]
				
				e.get_collider().damage(e.get_node("Emission").width * delta)
#				$"1/Label".text = str("colliding")
			else:
				e.get_node("Emission").set_point_position(1, Vector2(512, 0))
				e.get_node("ImpactFlare").hide()
				
#				e.collider.damage(1 * delta)
			
#			e.get_node("MuzzleFlare").self_modulate = Color.white
			



func no_shoot(delta):
	$"1/Label".text = str("no shoot")
	hide()
