class_name Action
extends RefCounted

#@export var sound: AudioStream

func execute(targets: Array[Node]) -> void:
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

# var duration: float
# var start_duration: float
# var action_type: ActionType
# var attack_action: AttackAction = AttackAction.NONE
# var damage_type: int
# var is_done: bool = false
# var amount: int = 0
# var target: Node
# var source: Node

# func set_values(target: Node, source: Node, amount: int = 0) -> void:
# 	self.target = target
# 	self.source = source
# 	self.amount = amount
# 	self.duration = DEFAULT_DURATION

# func is_dead_or_escaped(target: Node) -> bool:
# 	if target.is_dying or target.half_dead:
# 		return true
# 	#if not target.is_player:
# 		#var m = target as AbstractMonster
# 		#if m.is_escaping:
# 			#return true
# 	return false

# #func add_to_bot(action: Action) -> void:
# 	#AbstractDungeon.action_manager.add_to_bottom(action)
# #
# #func add_to_top(action: Action) -> void:
# 	#AbstractDungeon.action_manager.add_to_top(action)

# func update() -> void:
# 	pass

# func tick_duration() -> void:
# 	self.duration -= Engine.get_process_frames()
# 	if self.duration < 0.0:
# 		self.is_done = true

# func should_cancel_action() -> bool:
# 	return self.target == null or (self.source != null and self.source.is_dying) or self.is_dead_or_escaped(self.target)
