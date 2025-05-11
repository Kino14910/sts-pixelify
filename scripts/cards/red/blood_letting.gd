extends Card

func apply_actions(targets: Array[Node]) -> void:
	DamageAction.new(targets, damage, DamageAction.DamageType.HP_LOSS)
	GainEnergyAction.new([GameManager.player], magicNumber)
