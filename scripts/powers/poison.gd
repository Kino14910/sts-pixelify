class_name Poison
extends Power

var member_var = 0

func apply_power(target: Node) -> void:
	DamageAction.new([target], stacks, DamageAction.DamageType.HP_LOSS)
	
	power_applied.emit(self)


func get_tooltip() -> String:
	return tooltip % [stacks]
