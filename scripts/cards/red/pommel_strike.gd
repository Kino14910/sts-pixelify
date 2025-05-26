extends Card

func apply_actions(targets: Array[Node]) -> void:
	DamageAction.new(targets, damage)
	DrawCardAction.new([GameManager.player], magicNumber)
	
