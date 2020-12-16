extends Node2D

class_name Main

func _process(delta):
	if Input.is_action_just_pressed("cancel"):
		get_tree().quit(0)
		
		
