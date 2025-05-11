extends Card

@export var optional_sound: AudioStream
@export var Weakened: Power

func apply_actions(targets: Array[Node]) -> void:
	DamageAction.new(targets, damage)
	
	PowerAction.new(targets, Weakened.new(), magicNumber)
	
