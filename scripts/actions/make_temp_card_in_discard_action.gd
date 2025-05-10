class_name MakeTempCardInDiscardAction
extends Action

var card: Card

func _init(targets: Array[Node] = [], card: Card = null, amount: int = 0) -> void:
	self.card = card
	execute(targets, amount)

func execute(targets: Array[Node], amount: int) -> void:
	GameManager.player_handler.char_stats.discard.add_card.bind(card.duplicate())
