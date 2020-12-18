tool
extends StaticBody2D

class_name Asteroid

enum Size {
	LARGE,
	SMALL
}

export (Size) var size = Size.LARGE setget set_size

var velocity = Vector2()
var rocksplosion_scene = preload("res://RockSplosion.tscn")

func _ready():
	if size == Size.SMALL:
		$Health.hp = 4
		$AnimatedSprite.frame = rand_range(1, 3)
		$CollisionSmall.disabled = false
		$CollisionLarge.disabled = true
	if size == Size.LARGE:
		$Health.hp = 12
		$AnimatedSprite.frame = 0
		$CollisionSmall.disabled = true
		$CollisionLarge.disabled = false


func _process(delta):
	$Label.text = str($Health.hp)

func _physics_process(delta):
	if Engine.editor_hint:
		return
	position += velocity * delta
	velocity *= 0.99


func _on_Health_died():
	# if LARGE, split
	if size == Size.LARGE:
		for i in rand_range(3, 5):
			var child = duplicate()
			child.size = Size.SMALL
			child.velocity = Vector2.RIGHT.rotated(randf() * TAU) * rand_range(20, 100)
			get_tree().root.get_node("Main").add_child(child)
	# spawn explosion
	var rocksplosion = rocksplosion_scene.instance()
	rocksplosion.global_position = global_position
	if size == Size.SMALL: 
		rocksplosion.get_node("Particles2D").amount *= 0.5
		rocksplosion.get_node("Particles2D").process_material = rocksplosion.get_node("Particles2D").process_material.duplicate()
		rocksplosion.get_node("Particles2D").process_material.damping *= 2
		rocksplosion.get_node("Particles2D").process_material.initial_velocity *= 0.5
		rocksplosion.get_node("Particles2D").process_material.scale *= 0.7
	get_tree().root.get_node("Main").add_child(rocksplosion)

	queue_free()


func set_size(val):
	size = val
	if size == Size.SMALL:
		$Health.hp = 5
		$AnimatedSprite.frame = rand_range(1, 3)
		$CollisionSmall.disabled = false
		$CollisionLarge.disabled = true
	if size == Size.LARGE:
		$Health.hp = 1
		$AnimatedSprite.frame = 0
		$CollisionSmall.disabled = true
		$CollisionLarge.disabled = false


func damage(amt):
	$Health.damage(amt)
