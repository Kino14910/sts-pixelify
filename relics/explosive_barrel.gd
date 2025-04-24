extends Relic

@export var damage = 2


func activate_relic(owner: RelicUI) -> void:
	var monster = owner.get_tree().get_nodes_in_group('monster')
	DamageAction.new(monster, damage, DamageAction.DamageType.THORNS)
	
	owner.flash()
