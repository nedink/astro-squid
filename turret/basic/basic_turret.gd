extends Node2D

class_name BasicTurret


export var spin_speed = PI/4


onready var squid = get_tree().root.get_node("Main/Squid")


func _physics_process(delta):
	if $Area2D.overlaps_body(squid):
		# turn toward squid
		pass
