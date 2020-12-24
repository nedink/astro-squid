tool
extends Node2D

class_name BasicTurret


export var spin_speed = PI/4
export (float, 0, 3.14159) var angle = 0 setget set_angle


onready var squid = get_tree().root.get_node("Main/Squid")


func _physics_process(delta):
	if $RayCast2D.is_colliding():
		$RayCast2D/BasicShot.shoot(delta)

func set_angle(val):
	angle = val
	$RayCast2D.rotation = val

#static func lerp_angle(a, b, t):
#	if abs(a-b) >= PI:
#		if a > b:
#			a = normalize_angle(a) - 2.0 * PI
#		else:
#			b = normalize_angle(b) - 2.0 * PI
#	return lerp(a, b, t)
#
#static func normalize_angle(x):
#	return fposmod(x + PI, 2.0*PI) - PI
