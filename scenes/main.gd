extends Node


@onready var main_menu: Control = $MainMenu
@onready var pause_menu: Control = $PauseMenu
@onready var game: Node2D = $Game

var is_game_running: bool = false

				
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Jump") and not is_game_running:
		start_game()
	
	if is_game_running:
		if event.is_action_pressed("Pause"):
			print("test")
			if is_game_running:
				#game.pause()
				pause_menu.show()
				is_game_running = false
			else:
				#game.continue()
				pause_menu.hide()
				is_game_running = true

func start_game() -> void:
	main_menu.hide()
	#game.run()
	is_game_running = true
