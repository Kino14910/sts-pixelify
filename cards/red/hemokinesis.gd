extends Card

func apply_actions(targets: Array[Node], modifiers: ModifierHandler) -> void:
	DamageAction.new(targets[0].get_tree().get_nodes_in_group('player'), magicNumber, DamageAction.DamageType.HP_LOSS)
	DamageAction.new(targets, modifiers.get_modified_value(damage, Modifier.Type.DMG_DEALT))

func get_default_description() -> String:
	return description % [magicNumber, damage]
	
func get_updated_description(player_modifiers: ModifierHandler, monster_modifiers: ModifierHandler) -> String:
	var modified_dmg = player_modifiers.get_modified_value(damage, Modifier.Type.DMG_DEALT)

	if monster_modifiers:
		modified_dmg = monster_modifiers.get_modified_value(modified_dmg, Modifier.Type.DMG_TAKEN)

	return description % [magicNumber, modified_dmg]
