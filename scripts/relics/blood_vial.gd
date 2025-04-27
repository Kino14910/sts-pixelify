extends Relic

@export var heal_amount: int = 2


func activate_relic(owner: RelicUI) -> void:
	var player = GameManager.player
	if player:
		player.stats.heal(heal_amount)
		owner.flash()
