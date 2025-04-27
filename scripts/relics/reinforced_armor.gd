extends Relic

@export var block_bonus = 3


func activate_relic(owner: RelicUI) -> void:
	var player = owner.get_tree().get_nodes_in_group('player')
	GainBlockAction.new(player, block_bonus)
	
	owner.flash()
