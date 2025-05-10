extends Card

@export var Vulnerable: Power

func apply_actions(targets: Array[Node]) -> void:
	DamageAction.new(targets, damage)
	
	PowerAction.new(targets, Vulnerable.new(), magicNumber)
	
