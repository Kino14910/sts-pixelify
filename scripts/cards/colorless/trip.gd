extends Card

@export var power: Power

func apply_actions(targets: Array[Node]) -> void:
	PowerAction.new(targets, power, magicNumber)

func get_default_description() -> String:
	return description % magicNumber
