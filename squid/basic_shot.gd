extends Area2D

class_name BasicShot

export var speed = 250

func _physics_process(delta):
	if $RayCast2DTop.is_colliding():
		var point = $RayCast2DTop.get_collision_point()
		# hit here
		return
	if $RayCast2DBottom.is_colliding():
		var point = $RayCast2DTop.get_collision_point()
		# hit here
		return
	
	# move forward
	position.x += speed * delta
