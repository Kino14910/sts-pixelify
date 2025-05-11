class_name Dexterity
extends Power

var member_var = 0

func initialize_power(target: Node) -> void:
	power_changed.connect(_on_power_change.bind(target))
	_on_power_change(target)


func _on_power_change(target: Node) -> void:
	assert(target.get("modifier_handler"), "No modifiers on %s" % target)
	
	var block_gain_modifier: Modifier = target.modifier_handler.get_modifier(Modifier.Type.BLOCK_GAIN)
	assert(block_gain_modifier, "No block gain modifier on %s" % target)
	
	var dexterity_modifier_value = block_gain_modifier.get_value("dexterity")
	
	if not dexterity_modifier_value:
		dexterity_modifier_value = ModifierValue.create_new_modifier("dexterity", ModifierValue.Type.FLAT)
		
	dexterity_modifier_value.flat_value = stacks
	block_gain_modifier.add_new_value(dexterity_modifier_value)


func get_tooltip() -> String:
	var increase
	if stacks > 0:
		increase = '提升'
	else:
		increase = '下降'
		stacks = -stacks
	return tooltip % [increase, stacks]
