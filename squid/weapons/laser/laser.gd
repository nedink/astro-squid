extends Node2D

class_name Laser

export var level = 1
export var weaponType = "Laser"


func _ready():
	if is_in_group("squid"):
		for e in get_children():
			e.collision_mask = 2
	else:
		for e in get_children():
			e.collision_mask = 1


func shoot(delta):
	show()
	if Input.is_action_pressed("shoot"):
		for e in get_children():
			if e.is_colliding():
				e.get_node("Emission").set_point_position(1, Vector2(to_local(e.get_collision_point()).x, 0))
				e.get_node("ImpactFlare").position = Vector2(to_local(e.get_collision_point()).x, 0)
				e.get_node("ImpactFlare").show()
				e.get_collider().damage(e.get_node("Emission").width * delta)
			else:
				var right_x = (get_tree().root.get_node("Main/Camera/StageRight").global_position - get_tree().root.get_node("Main/Squid").global_position).x
				e.cast_to = Vector2(right_x, 0)
				$"1/Label".text = str(right_x)
				e.get_node("Emission").set_point_position(1, Vector2(right_x, 0))
				e.get_node("ImpactFlare").hide()
				
#				e.collider.damage(1 * delta)
			
#			e.get_node("MuzzleFlare").self_modulate = Color.white
			



func no_shoot(delta):
	hide()
