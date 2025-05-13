extends Card

func apply_actions(targets: Array[Node]) -> void:
	DamageAction.new(targets, damage)
	for target in targets:
		if target.power_handler._has_power('Poison'):
			DamageAction.new(targets, damage)
