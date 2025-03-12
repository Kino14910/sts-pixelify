extends Card

const STRENGTH = preload('res://powers/strength.tres')

func apply_actions(targets: Array[Node]) -> void:
	var power_action = PowerAction.new()
	var strength = STRENGTH.duplicate()
	strength.duration = magicNumber
	power_action.power = strength
	power_action.execute(targets, magicNumber)
