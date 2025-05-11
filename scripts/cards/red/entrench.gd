extends Card

func apply_actions(targets: Array[Node]) -> void:
	block = GameManager.player.stats.block
	GainBlockAction.new(targets, block)
