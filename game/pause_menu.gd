extends Control

@onready var MASTER_BUS_ID = AudioServer.get_bus_index("Master")
@onready var SFX_BUS_ID = AudioServer.get_bus_index("SFX")
@onready var MUSIC_BUS_ID = AudioServer.get_bus_index("Music")
@onready var master_slider: HSlider = $Options/MasterContainer/HBoxContainer/CenterContainer/MasterSlider
@onready var master_spin_box: SpinBox = $Options/MasterContainer/HBoxContainer/MasterSpinBox
@onready var music_slider: HSlider = $Options/MusicContainer/HBoxContainer/CenterContainer/MusicSlider
@onready var music_spin_box: SpinBox = $Options/MusicContainer/HBoxContainer/MusicSpinBox
@onready var sfx_slider: HSlider = $Options/SFXContainer/HBoxContainer/CenterContainer/SFXSlider
@onready var sfx_spin_box: SpinBox = $Options/SFXContainer/HBoxContainer/SFXSpinBox
@onready var continue_button: Button = $Options/Continue/ContinueButton
@onready var select: AudioStreamPlayer = $Select


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_focus_next") and get_viewport().gui_get_focus_owner() == null and visible:
		master_spin_box.grab_focus.call_deferred()
		
	if event.is_action_pressed("pause"):
		owner.pause_game()
		
		
#region Volume Functions
func set_master_volume(value: float) -> void:
	var linear_value := value / 100
	AudioServer.set_bus_volume_db(MASTER_BUS_ID, linear_to_db(linear_value))
	AudioServer.set_bus_mute(MASTER_BUS_ID, linear_value < .05)

func set_music_volume(value: float) -> void:
	var linear_value := value / 100
	AudioServer.set_bus_volume_db(MUSIC_BUS_ID, linear_to_db(linear_value))
	AudioServer.set_bus_mute(MUSIC_BUS_ID, linear_value < .05)
	
func set_sfx_volume(value: float) -> void:
	var linear_value := value / 100
	AudioServer.set_bus_volume_db(SFX_BUS_ID, linear_to_db(linear_value))
	AudioServer.set_bus_mute(SFX_BUS_ID, linear_value < .05)
#endregion
	
	
#region Volume Signals
func _on_master_slider_drag_ended(_value_changed: bool) -> void:
	set_master_volume(master_slider.value)
	master_spin_box.value = master_slider.value
	select.play()
	
func _on_master_spin_box_value_changed(value: float) -> void:
	set_master_volume(value)
	master_slider.value = value
	select.play()
	
func _on_music_slider_drag_ended(_value_changed: bool) -> void:
	set_music_volume(music_slider.value)
	music_spin_box.value = music_slider.value
	select.play()
		
func _on_music_spin_box_value_changed(value: float) -> void:
	set_music_volume(value)
	music_slider.value = value
	select.play()

func _on_sfx_slider_drag_ended(_value_changed: bool) -> void:
	set_sfx_volume(sfx_slider.value)
	sfx_spin_box.value = sfx_slider.value
	select.play()
	
func _on_sfx_spin_box_value_changed(value: float) -> void:
	set_sfx_volume(value)
	sfx_slider.value = value
	select.play()
#endregion

func _on_continue_button_pressed() -> void:
	select.play()

func _on_reset_no_button_pressed() -> void:
	var grow_check_button: CheckButton = $Options/GrowOption/GrowCheckButton
	grow_check_button.set_pressed_no_signal(!grow_check_button.button_pressed)
	grow_check_button.grab_focus.call_deferred()
