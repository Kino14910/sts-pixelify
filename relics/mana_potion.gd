class_name ManaPotion
extends Relic


func activate_relic(owner: RelicUI) -> void:
	Events.player_hand_drawn.connect(_add_energy.bind(owner), CONNECT_ONE_SHOT)
	#_add_energy(owner)

func _add_energy(owner: RelicUI) -> void:
	var player = owner.get_tree().get_first_node_in_group("player") as Player
	if player:
		player.stats.energy += 1
		owner.flash()
