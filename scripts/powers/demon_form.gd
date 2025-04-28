class_name DemonForm
extends Power

const STRENGTH = preload('res://scripts/powers/strength.tres')


func apply_power(target: Node) -> void:
	PowerAction.new([target], STRENGTH.new(), stacks)
	
	power_applied.emit(self)


func get_tooltip() -> String:
	return tooltip % stacks
