extends KinematicBody2D

class_name Squid


export var speed_up = 10
export var slow_down = 0.1
export var max_speed = 150

export var shot:PackedScene

var vel = Vector2()



func _physics_process(delta):
	if Input.is_action_pressed("shoot") and $Shooter/CooldownTimer.is_stopped():
		# spawn bullet
		var bullet = shot.instance()
		bullet.position = $Shooter.global_position
		get_parent().add_child(bullet)
		$Shooter/CooldownTimer.start()
	
	var add = Vector2()
	if Input.is_action_pressed("left"):
		add.x -= 1
	if Input.is_action_pressed("right"):
		add.x += 1
		$AnimatedSprite.speed_scale = 2
	else:
		$AnimatedSprite.speed_scale = 1
	if Input.is_action_pressed("up"):
		add.y -= 1
		$AnimatedSprite.play("up")
	if Input.is_action_pressed("down"):
		add.y += 1
		$AnimatedSprite.play("down")
	if not Input.is_action_pressed("up") and not Input.is_action_pressed("down"):
		$AnimatedSprite.play("default")
		
	if not Input.is_action_pressed("left") && not Input.is_action_pressed("right") && not Input.is_action_pressed("up") && not Input.is_action_pressed("down"):
		vel *= 1 - slow_down
	
	vel += add.normalized() * speed_up
	vel = vel.clamped(max_speed)
	vel = move_and_slide(vel)
	
	
