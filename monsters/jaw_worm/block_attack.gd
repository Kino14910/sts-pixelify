extends MonsterAction

@export var damage: int
@export var block: int

func perform_action() -> void:
	if not monster or not target:
		return

	GainBlockAction.new([monster], block)
	DamageAction.new([target], damage)
	Events.monster_action_completed.emit(monster)
