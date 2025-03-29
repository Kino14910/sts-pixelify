extends Card

func apply_actions(targets: Array[Node], _modifiers: ModifierHandler) -> void:
	GainBlockAction.new(targets, block)

func get_default_description() -> String:
	return description % block
	
