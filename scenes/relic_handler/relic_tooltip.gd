class_name RelicTooltip
extends Control

@onready var relic_tooltip: RichTextLabel = %RelicTooltip

func _ready() -> void:
	hide()

func show_tooltip(relic: Relic) -> void:
	relic_tooltip.text = relic.get_tooltip()
	show()
	global_position = get_global_mouse_position()
	if global_position.x + size.x > get_viewport_rect().position.x + get_viewport_rect().size.x:
		global_position.x = get_viewport_rect().position.x + get_viewport_rect().size.x - size.x
	if global_position.y + size.y > get_viewport_rect().position.y + get_viewport_rect().size.y:
		global_position.y = get_viewport_rect().position.y + get_viewport_rect().size.y - size.y
	
	size.y = relic_tooltip.size.y + 4

func hide_tooltip() -> void:
	hide()
