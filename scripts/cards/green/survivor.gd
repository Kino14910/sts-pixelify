extends Card

func apply_actions(targets: Array[Node]) -> void:
	GainBlockAction.new(targets, damage)
	DiscardAction.new(targets, 1)
