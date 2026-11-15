extends Node2D


@onready var meters: Label = $PlayerCamera/Meters
@onready var player: Player = $Player
var player_height: float = 0

func _physics_process(_delta: float) -> void:
	player_height = floor(player.height * 10) / 10
	meters.text = var_to_str(player_height)
	#900 = upper boundary of trampoline
