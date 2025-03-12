extends MonsterAction

@export var damage = randi_range(5, 7)


func perform_action() -> void:
	if not monster or not target:
		return
	
	var tween = create_tween().set_trans(Tween.TRANS_QUINT)
	var start = monster.global_position
	var end = monster.global_position + Vector2.LEFT * 8
	var damage_action = DamageAction.new()
	var target_array: Array[Node] = [target]
	
	tween.tween_property(monster, "global_position", end, 0.1)
	tween.tween_callback(damage_action.execute.bind(target_array, damage))
	tween.tween_property(monster, "global_position", start, 0.1)
	
	tween.finished.connect(
		func():
			Events.monster_action_completed.emit(monster)
	)


func update_intent_text() -> void:
	var player = target as Player
	if not player:
		return
	intent.current_text = intent.base_text
	#
	#var modified_dmg = player.modifier_handler.get_modified_value(damage, Modifier.Type.DMG_TAKEN)
	#intent.current_text = intent.base_text % modified_dmg
