extends Card

func apply_actions(targets: Array[Node]) -> void:
	ExhaustAction.new(targets, 1, false)
	DrawCardAction.new(targets, magicNumber)
	

func get_default_description() -> String:
	return description % [magicNumber]
