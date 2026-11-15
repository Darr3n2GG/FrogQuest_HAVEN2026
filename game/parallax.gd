extends Node2D

@onready var sky: Parallax2D = $Sky
@onready var clouds: Parallax2D = $Clouds
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player: Player = $"../Player"


var is_faded: bool = true 


func _physics_process(_delta: float) -> void:
	if !is_faded:
		if player.velocity.y < 0:
			animation_player.play("fade")
			is_faded = true
		else:
			animation_player.play("fade", -1, -1.0, true)
			is_faded = true
		
		
func _on_cloud_area_body_entered(_body: Node2D) -> void:
	is_faded = false
