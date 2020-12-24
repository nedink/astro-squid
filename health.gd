extends Node2D

class_name Health

export var hp = 1.0
export var disabled = false

var explosion_scene = preload("res://Explosion.tscn")

signal damaged
signal died

func _ready():
	connect("died", get_tree().root.get_node("Main"), "explode", [global_position])

func damage(amt):
	if disabled:
		return
	else:
		hp -= amt
	if hp <= 0:
		emit_signal("died")
	emit_signal("damaged", hp)
