class_name DrawCardAction
extends Action

func _init(targets: Array[Node], amount: int) -> void:
	execute(targets, amount)

func execute(targets: Array[Node], amount: int) -> void:
	for target in targets:
		if target is Monster:
			return
		if target is Player:
			Events.draw_cards.emit(amount)
