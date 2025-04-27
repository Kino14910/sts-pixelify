extends MonsterAction

@export var number: int

const STRENGTH = preload('res://powers/strength.tres')

func perform_action() -> void:
	if not monster or not target:
		return
	PowerAction.new([monster], STRENGTH.new(), number)
	Events.monster_action_completed.emit(monster)
