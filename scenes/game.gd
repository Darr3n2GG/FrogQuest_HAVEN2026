extends Node2D


@onready var meters: Label = $PlayerCamera/Meters
@onready var player: Player = $Player


func _physics_process(_delta: float) -> void:
	meters.text = var_to_str(900 - player.global_position.y)
	#900 = position of trampoline
	#trampoline.global_position.y is somehow at origin
