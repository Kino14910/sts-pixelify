class_name Action
extends RefCounted


func _init(targets: Array[Node], amount: int) -> void:
	execute(targets, amount)
	
func execute(targets: Array[Node], amount: int) -> void:
	pass

const DEFAULT_DURATION = 0.5

enum ActionType {
	BLOCK,
	POWER,
	CARD_MANIPULATION,
	DAMAGE,
	DEBUFF,
	DISCARD,
	DRAW,
	EXHAUST,
	HEAL,
	ENERGY,
	TEXT,
	USE,
	CLEAR_CARD_QUEUE,
	DIALOG,
	SPECIAL,
	WAIT,
	SHUFFLE,
	REDUCE_POWER
}

enum AttackAction {
	BLUNT_LIGHT,
	BLUNT_HEAVY,
	SLASH_DIAGONAL,
	SMASH,
	SLASH_HEAVY,
	SLASH_HORIZONTAL,
	SLASH_VERTICAL,
	NONE,
	FIRE,
	POISON,
	SHIELD,
	LIGHTNING
}
