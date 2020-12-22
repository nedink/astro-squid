extends Area2D

class_name PowerUp

export var weaponType = "BasicShot"


func _ready():
	connect("body_entered", self, "power_up")

func power_up(body):
	var w = body.get_node("Weapon").power_up(weaponType)
	queue_free()
