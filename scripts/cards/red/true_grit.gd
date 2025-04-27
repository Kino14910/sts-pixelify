extends Card

func apply_actions(targets: Array[Node]) -> void:
	GainBlockAction.new(targets, block)
	ExhaustAction.new(targets, magicNumber, true)
	

func get_default_description() -> String:
	return description % [block]
