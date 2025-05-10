extends Card

func apply_actions(targets: Array[Node]) -> void:
	DamageAction.new([GameManager.player], magicNumber, DamageAction.DamageType.HP_LOSS)
	DamageAction.new(targets, damage)
