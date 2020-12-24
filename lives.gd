tool
extends Label

class_name Lives


export var lives_left = 0 setget set_lives_left
signal game_over


func _on_Squid_died():
	set_lives_left(lives_left - 1)

func set_lives_left(val):
	lives_left = val
	text = "x" + str(lives_left)
	if lives_left < 0:
		hide()
		emit_signal("game_over")
	
