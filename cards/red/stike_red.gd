extends Card

func apply_action(targets: Array[Node]) -> void:
	var damage_action = DamageAction.new()
	damage_action.amount = 6
	damage_action.execute(targets)
