extends Card

@export var Metallicize: Power

func apply_actions(targets: Array[Node]) -> void:
	PowerAction.new(targets, Metallicize.new(), magicNumber)
