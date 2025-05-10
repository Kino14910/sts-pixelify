extends Card

@export var Vulnerable: Power
@export var Weakened: Power

func apply_actions(targets: Array[Node]) -> void:
	DamageAction.new(targets, damage)
	
	PowerAction.new(targets, Vulnerable.new(), magicNumber)
	PowerAction.new(targets, Weakened.new(), magicNumber)
	
