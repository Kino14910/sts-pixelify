extends Card

func apply_actions(targets: Array[Node]) -> void:
	MakeTempCardInDiscardAction.new(targets, self.duplicate(), 1)
	DamageAction.new(targets, damage)
