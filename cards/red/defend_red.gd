extends Card

func apply_action(targets: Array[Node]) -> void:
	var defend_action = GainBlockAction.new()
	defend_action.amount = 5
	defend_action.execute(targets)
