extends PowerUp


func power_up(body):
	# give player laser + 1
	body.upgrade_weapon("Laser")
	.queue_free()
