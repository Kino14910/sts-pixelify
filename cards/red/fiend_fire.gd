extends Card

func apply_actions(targets: Array[Node], modifiers: ModifierHandler) -> void:
	var player_handler = targets[0].get_tree().get_first_node_in_group('player').get_tree().get_first_node_in_group("player_handler") as PlayerHandler
	var handCount = player_handler.hand.get_child_count()
	ExhaustAction.new(targets, handCount, true)
	for i in handCount:
		DamageAction.new(targets, modifiers.get_modified_value(damage, Modifier.Type.DMG_DEALT))

	
func get_default_description() -> String:
	return description % [damage]
	

func get_updated_description(player_modifiers: ModifierHandler, monster_modifiers: ModifierHandler) -> String:
	var modified_dmg = player_modifiers.get_modified_value(damage, Modifier.Type.DMG_DEALT)

	if monster_modifiers:
		modified_dmg = monster_modifiers.get_modified_value(modified_dmg, Modifier.Type.DMG_TAKEN)
	return description % [modified_dmg]
