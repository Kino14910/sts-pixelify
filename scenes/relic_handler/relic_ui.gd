class_name RelicUI
extends Control

@export var relic: Relic: 
	set(value):
		if not is_node_ready():
			await ready

		relic = value
		icon.texture = relic.icon

@onready var icon: TextureRect = $Icon
@onready var animation_player: AnimationPlayer = $AnimationPlayer


var affordable = true: 
	set(value):
		affordable = value
		if not affordable:
			icon.modulate = Color(1, 1, 1, 0.5)
		else:
			icon.modulate = Color(1, 1, 1, 1)
			

func flash() -> void:
	animation_player.play("flash")


func _on_mouse_entered() -> void:
	Events.relic_tooltip_requested.emit(relic)


func _on_mouse_exited() -> void:
	Events.relic_tooltip_hide.emit()
