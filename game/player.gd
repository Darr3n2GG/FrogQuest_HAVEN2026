class_name Player extends CharacterBody2D


@export var gravity: float = 980.0


func _physics_process(delta: float) -> void:
	# add left right movement
	
	# pulled down by gravity
	velocity.y += gravity * delta
	
	# apply physics to the player
	move_and_slide()


# when frog touches trampoline
func _on_trampoline_body_entered(body: Node2D) -> void:
	if body == self:
		velocity.y = velocity.y * -2
