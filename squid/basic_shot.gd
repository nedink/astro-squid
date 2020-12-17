extends Area2D

class_name BasicShot

export var speed = 280

var impact_scene = preload("res://ShotImpact.tscn")


func _ready():
	if is_in_group("squid"):
		collision_layer = 1
		collision_mask = 2
	if is_in_group("others"):
		collision_layer = 2
		collision_mask = 1


func _physics_process(delta):
	
	# get distance to next position
	var displace = Vector2.RIGHT * speed * delta
	$RayCast2DTop.cast_to = displace
	$RayCast2DBot.cast_to = displace
	
	# check for collision (top + bottom)
	if $RayCast2DTop.is_colliding():
		hit($RayCast2DTop)
		return
	elif $RayCast2DBot.is_colliding():
		hit($RayCast2DBot)
		return
	else:
		# move forward
		position += displace
	
	


func hit(raycast:RayCast2D):
	var point = raycast.get_collision_point()
	# todo - hit marker here
	var collider = raycast.get_collider()
	if not collider.is_in_group("squid") and collider.has_node("Health"):
		collider.get_node("Health").damage(1)
	var impact = impact_scene.instance()
	impact.position = position
	get_tree().root.get_node("Main").add_child(impact)
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
