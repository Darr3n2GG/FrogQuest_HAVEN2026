extends CharacterBody2D
var initHeight: float 
var dir: int

const SPEED = 300.0

func _ready():
	global_position.y = initHeight
	if dir ==0:
		global_position.x = -960
		velocity.x = SPEED
	else:
		global_position.x = 960
		velocity.x = -SPEED

func _physics_process(_delta):
	move_and_slide()
