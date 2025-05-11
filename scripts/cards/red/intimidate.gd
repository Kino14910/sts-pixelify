extends Card

@export var Weakened: Power


func apply_actions(targets: Array[Node]) -> void:
	PowerAction.new(targets, Weakened.new(), magicNumber)