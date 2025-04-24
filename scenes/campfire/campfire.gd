class_name Campfire
extends Control

@export var char_stats: CharacterStats

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var rest_button: Button = %RestButton


func _on_rest_button_pressed() -> void:
	rest_button.disabled = true
	char_stats.heal(floori(char_stats.max_health * 0.3))
	animation_player.play('fade_out')


# This is called from the AnimationPlayer at the end of 'fade-out'.
# 在 AnimationPlayer 中的 'fade-out' 播放完毕后执行
func _on_fade_out_finished() -> void:
	Events.campfire_exited.emit()
