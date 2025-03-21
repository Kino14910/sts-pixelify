class_name Player
extends Node2D

const WHITE_SPRITE_MATERIAL = preload("res://art/white_sprite_material.tres")

@export var stats: CharacterStats:
	set(value):
		stats = value
		
		if not stats.stats_changed.is_connected(update_stats):
			stats.stats_changed.connect(update_stats)

		update_player()


@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var stats_ui: StatsUI = $StatsUI
@onready var selected_indicator: NinePatchRect = $SelectedIndicator

@onready var power_handler: PowerHandler = $PowerHandler
# @onready var modifier_handler: ModifierHandler = $ModifierHandler



func _ready() -> void:
	Events.card_aim_self_started.connect(_on_card_target_self_started)
	Events.card_aim_self_ended.connect(_on_card_target_self_ended)
	power_handler.power_owner = self


func update_player() -> void:
	if not stats is CharacterStats: 
		return
	if not is_inside_tree(): 
		await ready

	sprite_2d.texture = stats.art
	update_stats()


func update_stats() -> void:
	stats_ui.update(stats)


func take_damage(damage: int) -> void:
	if stats.health <= 0: 
		return
	
	var tween = create_tween()
	tween.tween_callback(Shaker.shake.bind(self, 16, 0.15))
	tween.tween_callback(stats.take_damage.bind(damage))
	tween.tween_interval(0.17)

	tween.finished.connect(
		func():
		#sprite_2d.material = null
				
		if stats.health <= 0:
			Events.player_died.emit()
			queue_free()
	)


func _on_card_target_self_started() -> void:
	selected_indicator.show()
	
func _on_card_target_self_ended() -> void:
	selected_indicator.hide()
