extends MonsterAction


func perform_action() -> void:
	if not monster or not target:
		return
	
	var tween = create_tween().set_trans(Tween.TRANS_QUINT)
	var start = monster.global_position
	var end = target.global_position + Vector2.RIGHT * 32
	
	SFXPlayer.play(sound)

	Events.monster_action_completed.emit(monster)
