extends Node

class_name Health

export var hp = 1.0

var explosion_scene = preload("res://Explosion.tscn")

signal damaged
signal died

func damage(amt):
	if has_node("Timer"):
		if $Timer.is_stopped():
			hp -= amt
			$Timer.start()
	else:
		hp -= amt
	if hp <= 0:
		emit_signal("died")
	emit_signal("damaged", hp)
