extends Card

func apply_actions(targets: Array[Node]) -> void:
	DamageAction.new(targets, damage)
	GainBlockAction.new([GameManager.player], block)
	
