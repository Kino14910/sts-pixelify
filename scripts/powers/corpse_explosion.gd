class_name CorpseExplosion
extends Power


func initialize_power(target: Node) -> void:
	Events.monster_died.connect(func ():
		DamageAction.new(GameManager.monsters as Array[Node], target.stats.max_health)
	)
