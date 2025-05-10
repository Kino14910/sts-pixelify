extends Card

func apply_actions(targets: Array[Node]) -> void:
	ExhaustAction.new(targets, 1, false)
	DrawCardAction.new(targets, magicNumber)
	
