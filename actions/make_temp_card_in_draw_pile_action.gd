class_name MakeTempCardInDrawPileAction
extends Action

var card: Card

func _init(targets: Array[Node] = [], card: Card = null, amount: int = 0) -> void:
	execute(targets, amount)
	self.card = card

func execute(targets: Array[Node], amount: int) -> void:
	GameManager.player_handler.char_stats.draw_pile.add_card.bind(card.duplicate())
