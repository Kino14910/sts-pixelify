class_name Monster
extends Area2D

const selected_indicator_size = Vector2(20, 20)
const WHITE_SPRITE_MATERIAL := preload("res://art/white_sprite_material.tres")

@export var stats: MonsterStats: 
	set(value):
		stats = value.instantiate()
		
		if not stats.stats_changed.is_connected(update_stats):
			stats.stats_changed.connect(update_stats)
			stats.stats_changed.connect(update_action)
		
		update_monster()

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var selected_indicator: NinePatchRect = $SelectedIndicator
@onready var stats_ui: StatsUI = $StatsUI
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@onready var intent_ui: IntentUI = $IntentUI
# @onready var status_handler: StatusHandler = $StatusHandler
# @onready var modifier_handler: ModifierHandler = $ModifierHandler

var monster_action_picker: MonsterActionPicker
var current_action: MonsterAction:
	set(value):
		current_action = value
		update_intent()


func _ready() -> void:
	# status_handler.status_owner = self
	var size_scale
	if sprite_2d.texture.get_width() < 32:
		size_scale = 1.5
	else: 
		size_scale = 1.1
	collision_shape_2d.shape.size.x = sprite_2d.texture.get_width() * size_scale
	collision_shape_2d.shape.size.y = sprite_2d.texture.get_height() * size_scale
	selected_indicator.size = collision_shape_2d.shape.size
	selected_indicator.position = selected_indicator.size / -2


func setup_ai() -> void:
	if monster_action_picker:
		monster_action_picker.queue_free()
	
	var new_action_picker = stats.ai.instantiate() as MonsterActionPicker
	add_child(new_action_picker)
	monster_action_picker = new_action_picker
	monster_action_picker.monster = self


func update_stats() -> void:
	stats_ui.update(stats)


func update_action() -> void:
	if not monster_action_picker:
		return
	
	if not current_action:
		current_action = monster_action_picker.get_action()
		return
	
	var new_conditional_action := monster_action_picker.get_first_conditional_action()
	if new_conditional_action and current_action != new_conditional_action:
		current_action = new_conditional_action


func update_monster() -> void:
	if not stats is Stats: 
		return
	if not is_inside_tree(): 
		await ready
	
	sprite_2d.texture = stats.art
	selected_indicator.size = collision_shape_2d.shape.size
	setup_ai()
	update_stats()


func update_intent() -> void:
	if current_action:
		current_action.update_intent_text()
		intent_ui.update_intent(current_action.intent)

func do_turn() -> void:
	stats.block = 0

	if not current_action:
		return

	current_action.perform_action()

func take_damage(damage: int) -> void:
	if stats.health <= 0:
		return
	
	var tween := create_tween()
	tween.tween_callback(Shaker.shake.bind(self, 16, 0.15))
	tween.tween_callback(stats.take_damage.bind(damage))
	tween.tween_interval(0.17)

	tween.finished.connect(
		func():
		#sprite_2d.material = null
				
		if stats.health <= 0:
			#Events.monster_died.emit(self)
			queue_free()
	)
		
		
#func take_damage(damage: int, which_modifier: Modifier.Type) -> void:
	#if stats.health <= 0:
		#return
#
	#sprite_2d.material = WHITE_SPRITE_MATERIAL
	#var modified_damage := modifier_handler.get_modified_value(damage, which_modifier)
#
	#var tween := create_tween()
	#tween.tween_callback(Shaker.shake.bind(self, 16, 0.15))
	#tween.tween_callback(stats.take_damage.bind(modified_damage))
	#tween.tween_interval(0.17)
#
	#tween.finished.connect(
		#func():
		#sprite_2d.material = null
				#
		#if stats.health <= 0:
			#Events.monster_died.emit(self)
			#queue_free()
	#)

func _on_area_entered(area: Area2D) -> void:
	selected_indicator.show()


func _on_area_exited(area: Area2D) -> void:
	selected_indicator.hide()
