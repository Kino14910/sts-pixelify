extends Card

func apply_actions(targets: Array[Node]) -> void:
	damage = GameManager.player.stats.block
	DamageAction.new(targets, damage)
