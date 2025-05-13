extends Card

@export var vulnerable: Power
@export var weakened: Power

func apply_actions(targets: Array[Node]) -> void:
	DamageAction.new(targets, damage)
	
	PowerAction.new(targets, vulnerable.new(), magicNumber)
	PowerAction.new(targets, weakened.new(), magicNumber)
	
