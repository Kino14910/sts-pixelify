class_name PauseMenu
extends CanvasLayer

signal save_and_quit

@onready var back_to_game_button: Button = %BackToGameButton
@onready var save_and_quit_button: Button = %SaveAndQuitButton
@onready var volume: HSlider = %Volume
@onready var mute: CheckBox = %Mute
@onready var option_button: OptionButton = %OptionButton

var pause_time: float
var target_volume: float = 1.0

func _ready() -> void:
	back_to_game_button.pressed.connect(_unpause)
	save_and_quit_button.pressed.connect(_on_save_and_quit_button_pressed)


func _process(delta: float) -> void:
	var volume_linear 
	for player: AudioStreamPlayer in MusicPlayer.get_children():
		volume_linear = db_to_linear(player.volume_db)
		volume_linear = lerp(volume_linear, target_volume, 8.0 * delta)
		player.volume_db = linear_to_db(volume_linear)
		player.stream_paused = get_tree().paused and Time.get_ticks_msec() > pause_time + 300


func _shortcut_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if visible:
			_unpause()
		else:
			_pause()


func _pause() -> void:
	show()
	get_tree().paused = true
	pause_time = Time.get_ticks_msec()


func _unpause() -> void:
	hide()
	get_tree().paused = false


func _on_save_and_quit_button_pressed() -> void:
	get_tree().paused = false
	save_and_quit.emit()


func _on_volume_value_changed(value: float) -> void:
	if value == 0:
		AudioServer.set_bus_mute(0, true)
	else:
		AudioServer.set_bus_mute(0, false)
		AudioServer.set_bus_volume_db(0, value / 8)


func _on_music_volume_value_changed(value: float) -> void:
	target_volume = value


func _on_sfx_volume_value_changed(value: float) -> void:
	for sfx: AudioStreamPlayer in SFXPlayer.get_children():
		sfx.volume_db = value


func _on_mute_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)


func _on_option_button_item_selected(index: int) -> void:
	match index:
		0: DisplayServer.window_set_size(Vector2i(1920, 1080))
		1: DisplayServer.window_set_size(Vector2i(1600, 900))
		2: DisplayServer.window_set_size(Vector2i(1280, 720))
	get_tree().root.move_to_center()

func _on_window_mode_option_button_item_selected(index: int) -> void:
	DisplayServer.window_set_mode(option_button.get_item_id(index))
