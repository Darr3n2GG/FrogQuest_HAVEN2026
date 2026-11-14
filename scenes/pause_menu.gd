extends Control


signal unpause


func _on_button_pressed() -> void:
	unpause.emit()
