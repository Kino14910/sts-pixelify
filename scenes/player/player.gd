class_name Player
extends Node2D

const WHITE_SPRITE_MATERIAL = preload("res://assets/white_sprite_material.tres")

@export var stats: CharacterStats:
	set(value):
		stats = value
		
		if not stats.stats_changed.is_connected(update_stats):
			stats.stats_changed.connect(update_stats)

		update_player()

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var stats_ui: StatsUI = $StatsUI
@onready var selected_indicator: NinePatchRect = $SelectedIndicator

@onready var power_handler: PowerHandler = $PowerHandler
@onready var modifier_handler: ModifierHandler = $ModifierHandler


func _ready() -> void:
	Events.card_aim_self_started.connect(_on_card_target_self_started)
	Events.card_aim_self_ended.connect(_on_card_target_self_ended)
	power_handler.power_owner = self
	stats_ui.pos_init()
	power_handler.position = stats_ui.position + Vector2(stats_ui.block.size.x, stats_ui.health.size.y)
	GameManager.player = self

func update_player() -> void:
	if not stats is CharacterStats: 
		return
	if not is_inside_tree(): 
		await ready

	animated_sprite_2d.sprite_frames = stats.char_sprite
	update_stats()


func update_stats() -> void:
	stats_ui.update(stats)


func take_damage(damage: int, modifier_type: Modifier.Type, damagetype: DamageAction.DamageType) -> void:
	if stats.health <= 0: 
		return
		
	var modified_damage = modifier_handler.get_modified_value(damage, modifier_type)
	
	var tween = create_tween()
	tween.tween_callback(Utils.shake.bind(self, 16, 0.15))
	tween.tween_callback(stats.take_damage.bind(modified_damage, damagetype))
	tween.tween_interval(0.17)

	tween.finished.connect(func():
		if stats.health <= 0:
			Events.player_died.emit()
			queue_free()
	)


func _on_card_target_self_started() -> void:
	selected_indicator.show()
	
func _on_card_target_self_ended() -> void:
	selected_indicator.hide()
