extends Control


@onready var prompt_text: RichTextLabel = $PromptText


func _process(_delta: float) -> void:
	var main := get_parent()
	if Input.is_action_just_pressed("Jump") and not main.is_game_running:
		hide()
		main.start_game()
		
