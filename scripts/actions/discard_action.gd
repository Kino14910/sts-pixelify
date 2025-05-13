class_name DiscardAction
extends Action


var player_handler: PlayerHandler
var random: bool


func _init(targets: Array[Node], amount:int, random: bool = false) -> void:
	self.random = random
	execute(targets, amount)


func execute(targets: Array[Node], amount: int) -> void:
	var char_stats: CharacterStats = GameManager.player_handler.char_stats
	var player_handler = GameManager.player_handler
	
	if not player_handler:
		return
	
	if player_handler.hand.is_empty():
		return



		
	self.player_handler = player_handler
		
	var cards_to_discard
	if random:
		var candidates = player_handler.hand.get_children().duplicate()
		var selected: Array[CardUI] = []
		
		for i in range(min(amount, candidates.size())):
			var random_index = randi() % candidates.size()
			selected.append(candidates[random_index])
			candidates.remove_at(random_index)
		cards_to_discard = selected
	else:
		cards_to_discard = player_handler.hand.get_children().slice(0, amount)
	
	for card in cards_to_discard:
		player_handler.hand.discard_card(card)
		char_stats.discard_pile.add_card(card.card)
		Events.card_discarded.emit()
