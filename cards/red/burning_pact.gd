extends Card

func apply_actions(targets: Array[Node], _modifiers: ModifierHandler) -> void:
	ExhaustAction.new(targets, 1, false)
	DrawCardAction.new(targets, magicNumber)
	

func get_default_description() -> String:
	return description % [magicNumber]
