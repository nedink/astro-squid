extends KinematicBody2D

class_name Squid


export var speed_up = 10
export var slow_down = 0.1
export var max_speed = 150

enum Weapon {
	BASIC,
	LAZER,
	SLIME,
	ZAPPP
}
export var weapon = Weapon.SLIME

var vel = Vector2()
var explosion_scene = preload("res://Explosion.tscn")

func _ready():
	pass


func _physics_process(delta):
	
	# accelerate
	var accel = Vector2()
	if Input.is_action_pressed("left"):
		accel.x -= 1
	if Input.is_action_pressed("right"):
		accel.x += 1
		$AnimatedSprite.speed_scale = 2
	else:
		$AnimatedSprite.speed_scale = 1
	if Input.is_action_pressed("up"):
		accel.y -= 1
		$AnimatedSprite.play("up")
	if Input.is_action_pressed("down"):
		accel.y += 1
		$AnimatedSprite.play("down")
	if not Input.is_action_pressed("up") and not Input.is_action_pressed("down"):
		$AnimatedSprite.play("default")
	vel += accel.normalized() * speed_up
	
	# slow down
	if (Input.is_action_pressed("left") and Input.is_action_pressed("right")) or (Input.is_action_pressed("up") and Input.is_action_pressed("down")) or not Input.is_action_pressed("left") and not Input.is_action_pressed("right") and not Input.is_action_pressed("up") and not Input.is_action_pressed("down"):
		vel *= 1 - slow_down
	
	# max speed
	vel = vel.clamped(max_speed)
	
	# screen extents
	if Input.is_action_pressed("right") and position.x - get_parent().get_node("Camera").position.x > 512:
		vel.x = min(0, vel.x)
	if Input.is_action_pressed("left") and position.x - get_parent().get_node("Camera").position.x < 0:
		vel.x = max(0, vel.x)
	if Input.is_action_pressed("down") and position.y - get_parent().get_node("Camera").position.y > 348:
		vel.y = min(0, vel.y)
	if Input.is_action_pressed("up") and position.y - get_parent().get_node("Camera").position.y < 72:
		vel.y = max(0, vel.y)
#	position = Vector2(clamp(position.x, 0, 480), position.y)
#	if (position + vel * delta > )
	
	var result:KinematicCollision2D = move_and_collide((vel + Vector2(40, 0)) * delta)
	
	# resolve collision
	if result:
		if result.collider.collision_layer == 0:
			vel = Vector2()
		if result.collider.get_collision_layer_bit(1):
			$AnimationPlayer.play("hit")
			vel = (vel.bounce(result.normal).normalized() * max_speed)
			$Label.text = str(funcref($Health, "damage"))
			$Health.damage(1.0)
	


# die if off screen 
func _on_VisibilityNotifier2D_screen_exited():
	die()

func die():
	var explosion = explosion_scene.instance()
	explosion.position = position
	get_tree().root.get_node("Main").add_child(explosion)
	# go to center 
	position = get_node("../Camera").position + Vector2(64, 200)
	# reset velocity
	vel = Vector2()
	# reset health
	$Health.hp = 4
	$AnimationPlayer.play("hit")

