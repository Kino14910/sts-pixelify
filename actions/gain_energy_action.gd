class_name GainEnergyAction
extends Action

func execute(targets: Array[Node], amount: int) -> void:
	GameManager.player_handler.char_stats.energy += amount
