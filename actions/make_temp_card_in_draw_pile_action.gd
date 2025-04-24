class_name MakeTempCardInDrawPileAction
extends Action

var card: Card

func _init(targets: Array[Node] = [], card: Card = null, amount: int = 0) -> void:
	execute(targets, amount)
	self.card = card

func execute(targets: Array[Node], amount: int) -> void:
	targets[0].get_tree().get_first_node_in_group('player').stats.draw_pile.add_card.bind(card.duplicate())
