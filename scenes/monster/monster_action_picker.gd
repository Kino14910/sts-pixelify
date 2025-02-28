class_name MonsterActionPicker
extends Node

@export var monster: Monster: 
	set(value):
		monster = value
		
		for action: MonsterAction in get_children():
			action.monster = monster


@export var target: Node2D: 
	set(value):
		target = value
		
		for action: MonsterAction in get_children():
			action.target = target


@onready var total_weight := 0.0


func _ready() -> void:
	target = get_tree().get_first_node_in_group("player")
	setup_chances()


func get_action() -> MonsterAction:
	var action := get_first_conditional_action()
	if action:
		return action
		
	return get_chance_based_action()


func get_first_conditional_action() -> MonsterAction:
	for action: MonsterAction in get_children():
		if not action or action.type != MonsterAction.Type.CONDITIONAL:
			continue
			
		if action.is_performable():
			return action
	
	return null


func get_chance_based_action() -> MonsterAction:
	var roll := randf_range(0.0, total_weight)
	
	for action: MonsterAction in get_children():
		if not action or action.type != MonsterAction.Type.CHANCE_BASED:
			continue
		
		if action.accumulated_weight > roll:
			return action
	
	return null


func setup_chances() -> void:
	for action: MonsterAction in get_children():
		if not action or action.type != MonsterAction.Type.CHANCE_BASED:
			continue
		
		total_weight += action.chance_weight
		action.accumulated_weight = total_weight
