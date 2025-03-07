extends Card

func apply_actions(targets: Array[Node]) -> void:
	var defend_action = GainBlockAction.new()
	defend_action.execute(targets, block)
