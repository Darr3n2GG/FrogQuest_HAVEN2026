extends CharacterBody2D
var initHeight: float 
var dir: int

const SPEED = 300.0

func _ready():
	global_position.y = initHeight
	$Timer.start()
	if dir ==0:
		global_position.x = 0
		velocity.x = SPEED
	else:
		global_position.x = 2000
		velocity.x = -SPEED

func _physics_process(_delta):
	move_and_slide()
	
	# despawn if out of screen
	if global_position.x < 0 or global_position.x > 2000:
		queue_free()


func _on_area_2d_body_entered(body):
	if body == Player:
		Global.damaged = true

#despawn after certain time
func _on_timer_timeout():
	queue_free()
