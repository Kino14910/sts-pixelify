extends Card

func apply_actions(targets: Array[Node]) -> void:
	DamageAction.new(targets, damage, DamageAction.DamageType.HP_LOSS)
	GainEnergyAction.new(targets, 2)
	DrawCardAction.new(targets, magicNumber)

func get_default_description() -> String:
	return description % [damage, 2, magicNumber]

func get_updated_description(player_modifiers: ModifierHandler, monster_modifiers: ModifierHandler) -> String:
	var modified_dmg = player_modifiers.get_modified_value(damage, Modifier.Type.DMG_DEALT)

	if monster_modifiers:
		modified_dmg = monster_modifiers.get_modified_value(modified_dmg, Modifier.Type.DMG_TAKEN)

	return description % [modified_dmg, 2, magicNumber]
