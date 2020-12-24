extends Node2D

export var pitch_scale = 1.0

func _ready():
	$AudioStreamPlayer.pitch_scale = pitch_scale
	$AudioStreamPlayer.play()
	z_index = -1
	for c in get_children():
		if c is Particles2D:
			c.emitting = true
			c.one_shot = true
			print(str(global_position))




func _on_Timer_timeout():
	queue_free()
