extends StaticBody2D

class_name LaserShip


export var speed = 1



func _ready():
	set_physics_process(false)

func _physics_process(delta):
	position += speed * delta



func _on_VisibilityNotifier2D_screen_entered():
	set_physics_process(true)
