extends Camera2D


export var scroll_speed = 20




func _physics_process(delta):
	position.x += scroll_speed * delta
