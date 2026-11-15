extends Node2D
var projectile_path = preload("res://game/projectile/projectile.tscn")

@onready var player: Player = $Player
var player_height: float = 0

func _physics_process(_delta: float) -> void:
	player_height = floor(player.height * 10) / 10
	if get_parent() != get_tree().root:
		get_parent().update_meters(player_height)
	#900 = upper boundary of trampoline

func summonProjectile():
	for i in range(100, player.maxHeight, -50):
		var projectile = projectile_path.instantiate()
		projectile.dir = randi_range(0,1)
		projectile.initHeight = 900 - i * 100
		call_deferred("add_child", projectile)
