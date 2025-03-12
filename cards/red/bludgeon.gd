extends Card

func apply_actions(targets: Array[Node]) -> void:
	var damage_action = DamageAction.new()
	damage_action.execute(targets, damage)
