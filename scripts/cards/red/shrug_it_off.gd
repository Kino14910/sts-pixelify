extends Card

func apply_actions(targets: Array[Node]) -> void:
	GainBlockAction.new(targets, block)
	DrawCardAction.new(targets, magicNumber)
	
