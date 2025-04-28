class_name MonsterAction
extends Node

enum Type {CHANCE_BASED, CONDITIONAL}

@export var intent: Intent
@export var sound: AudioStream
@export var type: Type
@export_range(0.0, 10.0) var chance_weight = 1.0

@onready var accumulated_weight = 0.0

var monster: Monster
var player: Node2D


func is_performable() -> bool:
	return false

func execute() -> void:
	perform_action()
	await get_tree().create_timer(0.6, false).timeout
	Events.monster_action_completed.emit(monster)

func perform_action() -> void:
	pass


func update_intent_text() -> void:
	intent.current_text = intent.base_text
