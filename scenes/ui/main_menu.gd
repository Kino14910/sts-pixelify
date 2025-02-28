extends Control


const CHAR_SELECT_MENU = preload('res://scenes/ui/char_selector.tscn')
#const RUN_SCENE = preload("res://scenes/run/run.tscn")

@onready var continue_btn: Button = $VBoxContainer/Continue

func _ready() -> void:
	get_tree().paused = false

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_packed(CHAR_SELECT_MENU)


func _on_continue_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
