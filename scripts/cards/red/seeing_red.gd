extends Card

func apply_actions(targets: Array[Node]) -> void:
	GainEnergyAction.new([GameManager.player], magicNumber)
