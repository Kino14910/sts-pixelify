extends Relic

@export var block_bonus:int = 6


func activate_relic(owner: RelicUI) -> void:
	var player = GameManager.player
	if player.stats.block == 0:
		GainBlockAction.new([player], block_bonus)
	
	owner.flash()
