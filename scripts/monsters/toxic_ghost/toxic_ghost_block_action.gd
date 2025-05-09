extends MonsterAction

@export var block = 10


func perform_action() -> void:
	if not monster or not player:
		return
	
	GainBlockAction.new([monster], block)
	
	get_tree().create_timer(0.6, false).timeout.connect(
		func():
			Events.monster_action_completed.emit(monster)
	)
