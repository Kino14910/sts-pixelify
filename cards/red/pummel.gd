extends Card

@export var optional_sound: AudioStream


func apply_actions(targets: Array[Node], modifiers: ModifierHandler) -> void:
	var tween = targets[0].create_tween().set_trans(Tween.TRANS_QUINT)
	for i in magicNumber:
		tween.tween_callback(DamageAction.new.bind(targets, modifiers.get_modified_value(damage, Modifier.Type.DMG_DEALT)))
		tween.tween_interval(0.2)
	
func get_default_description() -> String:
	return description % [damage, magicNumber]
	

func get_updated_description(player_modifiers: ModifierHandler, monster_modifiers: ModifierHandler) -> String:
	var modified_dmg = player_modifiers.get_modified_value(damage, Modifier.Type.DMG_DEALT)

	if monster_modifiers:
		modified_dmg = monster_modifiers.get_modified_value(modified_dmg, Modifier.Type.DMG_TAKEN)
	return description % [modified_dmg, magicNumber]
