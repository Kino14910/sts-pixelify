extends Card

func apply_actions(targets: Array[Node]) -> void:
	for target in targets:
		var poison = target.power_handler._get_power('Poison')
		if poison:
			poison.duration *= 2
