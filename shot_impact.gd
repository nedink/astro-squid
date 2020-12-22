extends Node2D

class_name BasicShotImpact

func _ready():
	$Particles2D.emitting = true
	$Particles2D.one_shot = true

