extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func update_animation(has_moved: bool, velocity_y: float):
	if !has_moved:
		play("idle")
	else:
		if velocity_y < 0:
			play("jump")
		else:
			play("fall")
