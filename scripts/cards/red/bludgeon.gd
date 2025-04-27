extends Card

func apply_actions(targets: Array[Node]) -> void:
	DamageAction.new(targets, damage)

func get_default_description() -> String:
	return description % damage

func get_updated_description(player_modifiers: ModifierHandler, monster_modifiers: ModifierHandler) -> String:
	var modified_dmg = player_modifiers.get_modified_value(damage, Modifier.Type.DMG_DEALT)

	if monster_modifiers:
		modified_dmg = monster_modifiers.get_modified_value(modified_dmg, Modifier.Type.DMG_TAKEN)
	return description % modified_dmg
