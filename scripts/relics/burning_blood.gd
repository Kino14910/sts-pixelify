extends Relic

@export var heal_amount = 6

func activate_relic(owner: RelicUI) -> void:
	var player = GameManager.player
	if player:
		player.stats.heal(heal_amount)
		owner.flash()
