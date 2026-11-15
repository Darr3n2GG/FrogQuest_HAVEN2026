class_name Player extends CharacterBody2D

@onready var criticalTime: Timer = $CriticalTime
@export var gravity: float = 980.0
@export var motion: int = 300
@export var levelBoundary: Array = [20, 200, 400, 800]
@export var levelMultiplier: Array = [-1.4, -1.8, -2.0, -2.5]
var speed: int = 0
var graviAcc: float = 0
var bounceMultiplier: float = -1.1
var jumped: bool = false
var level: int = 0
var height: float = 0
var hasMoved: bool = false


func _physics_process(delta: float) -> void:
	height = (900 - global_position.y)/100
	if Input.is_action_pressed("Jump") and !jumped:
		# activate movement after first jump
		graviAcc = gravity
		speed = motion
		hasMoved = true
		# increase the multiplier temporarily
		criticalTime.start(level + 1)
		bounceMultiplier = levelMultiplier[level]
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
	
	# die if fall below trampoline
	if height < -10:
		Global.gameOver = true
	


# when frog touches trampoline
func _on_trampoline_body_entered(body: Node2D) -> void:
	if body == self:
		if Global.damaged and !jumped:
			Global.gameOver = true
		
		velocity.y = velocity.y * bounceMultiplier
		bounceMultiplier = -1.1 # reset the multiplier after each jump
		jumped = false # reset jump state
		Global.damaged = false # reset damaged state
		
		if level > 0:
			get_parent().summonProjectile()
		
		

# player hit jump too early
func _on_critical_time_timeout():
	# reduce the multiplier if time out
	if velocity.y >0:
		bounceMultiplier = -1.1
	if Global.damaged: #damaged but failed to hit within time
		Global.gameOver = true

func change_level():
	if level < len(levelBoundary) -1:
		if height > levelBoundary[level]:
			level += 1
