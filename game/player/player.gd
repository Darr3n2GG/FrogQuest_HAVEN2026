class_name Player extends CharacterBody2D

@onready var criticalTime: Timer = $CriticalTime
@export var gravity: float = 980.0
@export var motion: int = 300
@export var levelBoundary: Array = [50, 200, 400]
var speed: int = 0
var graviAcc: float = 0
var bounceMultiplier: float = -1.2
var jumped: bool = false
var level: int = 0
var height: float = 0


func _physics_process(delta: float) -> void:
	height = (900 - global_position.y)/100
	if Input.is_action_pressed("Jump") and !jumped:
		# activate movement after first jump
		graviAcc = gravity
		speed = motion
		# start timer, increase the multiplier
		criticalTime.start()
		bounceMultiplier = -1.5
		# avoid spam jump
		jumped = true
		
	# left right movement
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * speed
	else: 
		velocity.x = move_toward(velocity.x, 0, speed)
	# pulled down by gravity
	velocity.y += graviAcc * delta
	# apply physics to the players
	move_and_slide()
	
	change_level()

# when frog touches trampoline
func _on_trampoline_body_entered(body: Node2D) -> void:
	if body == self:
		criticalTime.start()
		velocity.y = velocity.y * bounceMultiplier
		bounceMultiplier = -1.2 # reset the multiplier after each jump
		jumped = false # reset jump state

# player hit jump too early
func _on_critical_time_timeout():
	# reduce the multiplier if time out
	if velocity.y >0:
		bounceMultiplier = -1.2

func change_level():
	if height > levelBoundary[level]:
		level += 1
