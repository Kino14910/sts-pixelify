extends CardState

var played: bool

func enter() -> void:
	if not card_ui.targets.is_empty():
		card_ui.play()


func post_enter() -> void:
	transition_requested.emit(self, CardState.State.BASE)
