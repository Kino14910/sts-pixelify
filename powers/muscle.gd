class_name MusclePower
extends Power


func get_tooltip() -> String:
	return tooltip % stacks


#func initialize_power(target: Node) -> void:
	#power_changed.connect(_on_power_changed.bind(target))
	#_on_power_changed(target)
#
#
#func _on_power_changed(target: Node) -> void:
	#assert(target.get("modifier_handler"), "No modifiers on %s" % target)
	#
	#var dmg_dealt_modifier: Modifier = target.modifier_handler.get_modifier(Modifier.Type.DMG_DEALT)
	#assert(dmg_dealt_modifier, "No dmg dealt modifier on %s" % target)
	#
	#var muscle_modifier_value = dmg_dealt_modifier.get_value("muscle")
	#
	#if not muscle_modifier_value:
		#muscle_modifier_value = ModifierValue.create_new_modifier("muscle", ModifierValue.Type.FLAT)
		#
	#muscle_modifier_value.flat_value = stacks
	#dmg_dealt_modifier.add_new_value(muscle_modifier_value)
#
