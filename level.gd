extends Node2D

class_name Level


#func _ready():
#	$AudioStreamPlayer


func _on_Lives_game_over():
	$AudioStreamPlayer.stop()
	get_tree().paused = true
#	$Tween.interpolate_property($AudioStreamPlayer, "volume_db", 0, -80, 4, Tween.TRANS_LINEAR)
	pass # Replace with function body.
