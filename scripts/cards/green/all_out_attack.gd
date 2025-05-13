extends Card

func apply_actions(targets: Array[Node]) -> void:
	DamageAction.new(targets, damage)
	DiscardAction.new([GameManager.player], 1, true)
