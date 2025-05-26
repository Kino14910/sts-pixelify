extends Card

func apply_actions(targets: Array[Node]) -> void:
	for i in range(magicNumber):
		var random_target = targets[randi() % targets.size()]
		DamageAction.new([random_target], damage)
