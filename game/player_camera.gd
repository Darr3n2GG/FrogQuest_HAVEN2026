class_name PlayerCamera extends Camera2D


@export var player: CharacterBody2D


func _physics_process(_delta: float) -> void:
	# editable camera logic
	# can have lerp for smooth camera tracking based on speed
	global_position = move_toward(global_position, player.global_position, 100.0)
