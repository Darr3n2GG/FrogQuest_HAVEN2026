class_name Player extends CharacterBody2D


@export var gravity: float = 980.0
const SPEED: int = 300


func _physics_process(delta: float) -> void:
	# add left right movement
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else: 
		velocity.x = move_toward(velocity.x, 0, SPEED)
	# pulled down by gravity
	velocity.y += gravity * delta
	
	# apply physics to the players
	move_and_slide()
	


# when frog touches trampoline
func _on_trampoline_body_entered(body: Node2D) -> void:
	if body == self:
		velocity.y = velocity.y * -1.2
