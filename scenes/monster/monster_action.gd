class_name MonsterAction
extends Node

enum Type {CHANCE_BASED, CONDITIONAL}

@export var intent: Intent
@export var sound: AudioStream
@export var type: Type
@export_range(0.0, 10.0) var chance_weight = 1.0

@onready var accumulated_weight = 0.0

var monster: Monster
var target: Node2D


func is_performable() -> bool:
	return false


func perform_action() -> void:
	pass


func update_intent_text() -> void:
	intent.current_text = intent.base_text
