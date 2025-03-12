# meta-name: MonsterAction
# meta-description: An action which can be performed by an monster during its turn.
extends MonsterAction


func perform_action() -> void:
	if not monster or not target:
		return
	
	var tween = create_tween().set_trans(Tween.TRANS_QUINT)
	var start = monster.global_position
	var end = target.global_position + Vector2.RIGHT * 32
	
	SFXPlayer.play(sound)

	Events.monster_action_completed.emit(monster)


# If the monster has dynamic intent text you can override the base behaviour here
# e.g. for attack actions, the Player's DMG TAKEN modifier modifies the resulting damage number.
func update_intent_text() -> void:
	var player = target as Player
	if not player:
		return
	
	#var modified_dmg = player.modifier_handler.get_modified_value(6, Modifier.Type.DMG_TAKEN)
	#intent.current_text = intent.base_text % modified_dmg
	intent.current_text = intent.base_text
