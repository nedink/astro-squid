extends AnimatedSprite





func _ready():
	get_tree().root.get_node("Main/Squid/Health").connect("damaged", self, "set_frame")
	


#func change_frame(hp):
#	frame = int(hp - 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
