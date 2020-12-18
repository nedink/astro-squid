extends Area2D

class_name PowerUp

func _ready():
	connect("body_entered", self, "power_up")

func power_up(body):
	pass
