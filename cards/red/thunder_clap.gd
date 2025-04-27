extends Card

const VULNERABLE = preload('res://powers/vulnerable.tres')


func apply_actions(targets: Array[Node], modifiers: ModifierHandler) -> void:
	DamageAction.new(targets, damage)
	
	PowerAction.new(targets, VULNERABLE.new(), magicNumber)
	

func get_default_description() -> String:
	return description % [damage, magicNumber]

func get_updated_description(player_modifiers: ModifierHandler, monster_modifiers: ModifierHandler) -> String:
	var modified_dmg = player_modifiers.get_modified_value(damage, Modifier.Type.DMG_DEALT)

	if monster_modifiers:
		modified_dmg = monster_modifiers.get_modified_value(modified_dmg, Modifier.Type.DMG_TAKEN)
	return description % [modified_dmg, magicNumber]
