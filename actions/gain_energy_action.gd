class_name GainEnergyAction
extends Action

func _init(targets: Array[Node], amount: int) -> void:
	execute(targets, amount)

func execute(targets: Array[Node], amount: int) -> void:
	targets[0].get_tree().get_first_node_in_group('player').stats.energy += amount
