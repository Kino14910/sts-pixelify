class_name RelicTooltip
extends Control

@onready var relic_tooltip: RichTextLabel = %RelicTooltip

func _ready() -> void:
	hide()

func show_tooltip(relic: Relic) -> void:
	relic_tooltip.text = relic.get_tooltip()
	show()
	relic_tooltip.reset_size()
	global_position = get_global_mouse_position()
	if global_position.x + size.x > get_viewport_rect().end.x:
		global_position.x = get_viewport_rect().end.x - size.x
	if global_position.y + size.y > get_viewport_rect().end.y:
		global_position.y = get_viewport_rect().end.y - size.y

	size.y = relic_tooltip.size.y + 4


func hide_tooltip() -> void:
	hide()
