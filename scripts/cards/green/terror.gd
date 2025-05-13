extends Card

@export var vulnerable: Power

func apply_actions(targets: Array[Node]) -> void:
	PowerAction.new(targets, vulnerable.new(), 3)
