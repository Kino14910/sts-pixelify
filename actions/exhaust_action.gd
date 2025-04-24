class_name ExhaustAction
extends Action


var player_handler: PlayerHandler
var random: bool


func _init(targets: Array[Node], amount:int, random: bool = false) -> void:
	self.random = random
	execute(targets, amount)


func execute(targets: Array[Node], amount: int) -> void:
	var player: Player = targets[0].get_tree().get_first_node_in_group('player')
	var char_stats: CharacterStats = player.stats
	var player_handler = player.get_tree().get_first_node_in_group('player_handler') as PlayerHandler
	
	if not player_handler:
		return
	
	if player_handler.hand.is_empty():
		return
		
	self.player_handler = player_handler
		
	var cards_to_exhaust
	if random:
		var candidates = player_handler.hand.get_children().duplicate()
		var selected: Array[CardUI] = []
		
		for i in range(min(amount, candidates.size())):
			var random_index = randi() % candidates.size()
			selected.append(candidates[random_index])
			candidates.remove_at(random_index)
		cards_to_exhaust = selected
	else:
		cards_to_exhaust = player_handler.hand.get_children().slice(0, amount)
	
	for card in cards_to_exhaust:
		player_handler.hand.discard_card(card)
		char_stats.exhaust_pile.add_card(card.card)
		Events.card_exhausted.emit()
