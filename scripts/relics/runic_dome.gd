extends Relic

var already_initialized = false


func initialize_relic(owner: RelicUI) -> void:
	# makes sure we don't have extra mana when we keep saving and loading the game
	# 防止sl后增加魔力
	if already_initialized:
		return

	var char_stats = GameManager.run.char_stats
	char_stats.max_mana += 1
	char_stats.mana = char_stats.max_mana
	already_initialized = true


func activate_relic(owner: RelicUI) -> void:
	owner.get_tree().call_group("intent", "set", "modulate", Color.TRANSPARENT)


func deactivate_relic(owner: RelicUI) -> void:
	GameManager.run.char_stats.max_mana -= 1
