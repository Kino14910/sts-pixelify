class_name Metallicize
extends Power


func apply_power(target: Node) -> void:
	GainBlockAction.new([target], stacks)
	
	power_applied.emit(self)


func get_tooltip() -> String:
	return tooltip % stacks
