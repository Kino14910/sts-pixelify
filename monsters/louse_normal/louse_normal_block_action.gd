extends MonsterAction

@export var block := 6


func perform_action() -> void:
	if not monster or not target:
		return
	
	var block_action := GainBlockAction.new()
	block_action.amount = block
	#block_action.sound = sound
	block_action.execute([monster])
	
	get_tree().create_timer(0.6, false).timeout.connect(
		func():
			Events.monster_action_completed.emit(monster)
	)
