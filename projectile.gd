extends CharacterBody2D
var initHeight: float 
var dir: int

const SPEED = 300.0

func _ready():
	global_position.y = initHeight
	if dir ==0:
		global_position.x = 0
		velocity.x = SPEED
	else:
		global_position.x = 2000
		velocity.x = -SPEED
	$Timer.start()

func _physics_process(_delta):
	move_and_slide()

func _on_timer_timeout():
	# kills the bird after 5 seconds of spawning
	queue_free()
