class_name HealthUI
extends HBoxContainer


@onready var label: Label = $Label


func _ready() -> void:
	label.text = "0/0"


func _update_health(char_stats: CharacterStats) -> void:
	label.text = str(char_stats.health) + '\\' + str(char_stats.max_health)
