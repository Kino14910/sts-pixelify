class_name VulnerablePower
extends Power

const MODIFIER = 0.5


func initialize_power(target: Node) -> void:
	assert(target.get("modifier_handler"), "No modifiers on %s" % target)
	
	var dmg_taken_modifier: Modifier = target.modifier_handler.get_modifier(Modifier.Type.DMG_TAKEN)
	assert(dmg_taken_modifier, "No dmg taken modifier on %s" % target)

	var vulnerable_modifier_value = dmg_taken_modifier.get_value("vulnerable")

	if not vulnerable_modifier_value:
		vulnerable_modifier_value = ModifierValue.create_new_modifier("vulnerable", ModifierValue.Type.PERCENT_BASED)
		vulnerable_modifier_value.percent_value = MODIFIER
		dmg_taken_modifier.add_new_value(vulnerable_modifier_value)
	
	if not power_changed.is_connected(_on_power_change):
		power_changed.connect(_on_power_change.bind(target, dmg_taken_modifier))


func _on_power_change(target: Node, dmg_taken_modifier: Modifier) -> void:
	if duration <= 0 and dmg_taken_modifier:
		dmg_taken_modifier.remove_value("vulnerable")
		

func get_tooltip() -> String:
	return tooltip % [MODIFIER * 100, duration]
