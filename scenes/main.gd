extends Node


@onready var main_menu: Control = $GUI/MainMenu
@onready var pause_menu: Control = $GUI/PauseMenu
@onready var game: Node2D = $Game

var is_in_main_menu: bool = true
var is_game_running: bool = false

				
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Jump") and is_in_main_menu:
		start_game()
	
	if event.is_action_pressed("Pause") and not is_in_main_menu:
		toggle_pause()


func start_game() -> void:
	main_menu.hide()
	game.process_mode = Node.PROCESS_MODE_INHERIT
	is_game_running = true
	is_in_main_menu = false
	
func toggle_pause() -> void:
	if is_game_running:
		pause_menu.show()
		game.process_mode = Node.PROCESS_MODE_DISABLED
		is_game_running = false
	else:
		pause_menu.hide()
		game.process_mode = Node.PROCESS_MODE_INHERIT
		is_game_running = true


func _on_pause_menu_unpause() -> void:
	pause_menu.hide()
	game.process_mode = Node.PROCESS_MODE_INHERIT
	is_game_running = true
