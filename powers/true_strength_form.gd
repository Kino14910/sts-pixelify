class_name TrueStrengthPower
extends Power

const STRENGTH = preload('res://powers/strength.tres')


func apply_power(target: Node) -> void:
	PowerAction.new([target], STRENGTH.new(), stacks)
	
	power_applied.emit(self)


func get_tooltip() -> String:
	return tooltip % stacks
