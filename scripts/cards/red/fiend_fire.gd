extends Card

func apply_actions(targets: Array[Node]) -> void:
	var handCount = GameManager.player_handler.hand.get_child_count()
	ExhaustAction.new(targets, handCount, true)
	for i in handCount:
		DamageAction.new(targets, damage)
