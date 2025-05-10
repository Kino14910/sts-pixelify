extends Card

@export var Weakened: Power
@export var Vulnerable: Power


func apply_actions(targets: Array[Node]) -> void:
	PowerAction.new(targets, Weakened.new(), magicNumber)
	PowerAction.new(targets, Vulnerable.new(), magicNumber)
	
