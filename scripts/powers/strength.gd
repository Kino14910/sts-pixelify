class_name StrengthPower
extends Power

var member_var = 0


func initialize_power(target: Node) -> void:
	power_changed.connect(_on_power_change.bind(target))
	_on_power_change(target)


func _on_power_change(target: Node) -> void:
	
	assert(target.get("modifier_handler"), "No modifiers on %s" % target)
	
	var dmg_dealt_modifier: Modifier = target.modifier_handler.get_modifier(Modifier.Type.DMG_DEALT)
	assert(dmg_dealt_modifier, "No dmg dealt modifier on %s" % target)
	
	var strength_modifier_value = dmg_dealt_modifier.get_value("strength")
	
	if not strength_modifier_value:
		strength_modifier_value = ModifierValue.create_new_modifier("strength", ModifierValue.Type.FLAT)
		
	strength_modifier_value.flat_value = stacks
	dmg_dealt_modifier.add_new_value(strength_modifier_value)

func get_tooltip() -> String:
	return tooltip % stacks
