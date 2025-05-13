class_name ManaPotion
extends Relic

func activate_relic(owner: RelicUI) -> void:
	if GameManager.room.battle_stats.battle_tier > 1:
		_add_energy(owner)
		

func _add_energy(owner: RelicUI) -> void:
	var player = GameManager.player
	if player:
		player.stats.energy += 1
		owner.flash()
