class_name HealthUI
extends HBoxContainer


@onready var label: Label = $Label


func _ready() -> void:
	label.text = "0/0"


func _update_health(character: CharacterStats) -> void:
	label.text = str(character.health) + '\\' + str(character.max_health)
