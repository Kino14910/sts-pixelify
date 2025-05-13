extends Card

@export var vulnerable: Power

func apply_actions(targets: Array[Node]) -> void:
	DamageAction.new(targets, damage)
	
	PowerAction.new(targets, vulnerable.new(), magicNumber)
	
