extends Node2D

class_name Main

func _process(delta):
	if Input.is_action_just_pressed("cancel"):
		get_tree().quit(0)
	
	$Camera/Label.text = ""
	$Camera/Label.text += "FPS " + str(Engine.get_frames_per_second()) + "\n"
	$Camera/Label.text += "NODES " + str(get_tree().get_node_count()) + "\n"
	


func _on_Squid_died():
	$AnimationPlayer.play("game_over")
