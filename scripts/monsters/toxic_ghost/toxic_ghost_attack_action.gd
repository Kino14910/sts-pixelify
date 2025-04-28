extends MonsterAction

const SLIMED = preload('res://scripts/cards/status/slimed.tres')

@export var damage = 8


func perform_action() -> void:
	if not monster or not player:
		return
	
	var player = player as Player
	if not player:
		return
	
	var tween = create_tween().set_trans(Tween.TRANS_QUINT)
	var start = monster.global_position
	var end = monster.global_position + Vector2.LEFT * 8
	
	var player_array: Array[Node] = [player]

	tween.tween_property(monster, "global_position", end, 0.1)
	tween.tween_callback(DamageAction.new().execute.bind(player_array, player.modifier_handler.get_modified_value(damage, Modifier.Type.DMG_TAKEN)))
	tween.tween_callback(MakeTempCardInDrawPileAction.new().execute.bind(player_array, SLIMED, 1))
	tween.tween_interval(0.25)
	tween.tween_property(monster, "global_position", start, 0.1)
	
	tween.finished.connect(
		func():
			Events.monster_action_completed.emit(monster)
	)


func update_intent_text() -> void:
	var player = player as Player
	if not player:
		return
	
	var modified_dmg = player.modifier_handler.get_modified_value(damage, Modifier.Type.DMG_TAKEN)
	var final_dmg = monster.modifier_handler.get_modified_value(modified_dmg, Modifier.Type.DMG_DEALT)
	intent.current_text = intent.base_text % final_dmg
