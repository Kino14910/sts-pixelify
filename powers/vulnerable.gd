class_name VulnerablePower
extends Power

const MODIFIER = 0.5


func get_tooltip() -> String:
	return tooltip % duration

func apply_power(target: Node) -> void:
	print('%s should take %s%% more damage!' % [target, MODIFIER * 100])
	var damage_action = DamageAction.new()
	damage_action.execute([target], 12)
	
	power_applied.emit(self)

#
#func initialize_power(target: Node) -> void:
	#assert(target.get("modifier_handler"), "No modifiers on %s" % target)
	#
	#var dmg_taken_modifier: Modifier = target.modifier_handler.get_modifier(Modifier.Type.DMG_TAKEN)
	#assert(dmg_taken_modifier, "No dmg taken modifier on %s" % target)
#
	#var exposed_modifier_value = dmg_taken_modifier.get_value("exposed")
#
	#if not exposed_modifier_value:
		#exposed_modifier_value = ModifierValue.create_new_modifier("exposed", ModifierValue.Type.PERCENT_BASED)
		#exposed_modifier_value.percent_value = MODIFIER
		#dmg_taken_modifier.add_new_value(exposed_modifier_value)
	#
	#if not power_changed.is_connected(_on_power_changed):
		#power_changed.connect(_on_power_changed.bind(dmg_taken_modifier))
#
#
#func _on_power_changed(dmg_taken_modifier: Modifier) -> void:
	#if duration <= 0 and dmg_taken_modifier:
		#dmg_taken_modifier.remove_value("exposed")
