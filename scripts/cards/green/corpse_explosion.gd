extends Card

@export var posion: Power
@export var corpse_explosion: Power

func apply_actions(targets: Array[Node]) -> void:
	PowerAction.new(targets, posion.new(), magicNumber)
	PowerAction.new(targets, corpse_explosion.new(), magicNumber)