extends Card

@export var Barricade: Power

func apply_actions(targets: Array[Node]) -> void:
	PowerAction.new(targets, Barricade.new())
