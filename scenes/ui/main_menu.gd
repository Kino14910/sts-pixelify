extends Control


const CHAR_SELECT_MENU = preload('res://scenes/ui/char_selector.tscn')
const RUN_SCENE = preload("res://scenes/run/run.tscn")

@export var run_startup: RunStartup

@onready var continue_btn: Button = $VBoxContainer/Continue

func _ready() -> void:
	get_tree().paused = false
	continue_btn.disabled = SaveGame.load_data() == null


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_packed(CHAR_SELECT_MENU)


func _on_continue_pressed() -> void:
	run_startup.type = RunStartup.Type.CONTINUED_RUN
	get_tree().change_scene_to_packed(RUN_SCENE)


func _on_exit_pressed() -> void:
	get_tree().quit()
