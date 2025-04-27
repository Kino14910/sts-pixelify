extends MonsterAction

@export var block: int
@export var magicNumber: int

const STRENGTH = preload('res://powers/strength.tres')

func perform_action() -> void:
	if not monster or not target:
		return
	PowerAction.new([monster], STRENGTH.new(), magicNumber)
	GainBlockAction.new([monster], block)
	Events.monster_action_completed.emit(monster)
