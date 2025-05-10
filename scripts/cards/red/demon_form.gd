extends Card

@export var DemonForm: Power

func apply_actions(targets: Array[Node]) -> void:
	PowerAction.new(targets, DemonForm.new(), magicNumber)
