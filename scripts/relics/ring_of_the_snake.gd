extends Relic

func activate_relic(owner: RelicUI) -> void:
	DrawCardAction.new([GameManager.player], 1)
	owner.flash()
