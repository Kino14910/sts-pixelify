extends CardState

func enter() -> void:
	if !card_ui.is_node_ready():
		await card_ui.ready
	
	if card_ui.tween and card_ui.tween.is_running():
		card_ui.tween.kill()
	# card_ui.reparent_requested.emit(card_ui)
	card_ui.panel.set("theme_override_styles/panel", card_ui.BASE_STYLE)


func on_gui_input(event: InputEvent) -> void:
	if not card_ui.playable or card_ui.disabled:
		return

	#if (event is InputEventMouseButton 
		#and event.button_index == MOUSE_BUTTON_LEFT 
		#and event.pressed):
	if event.is_action_pressed('left_mouse'):
		transition_requested.emit(self, CardState.State.CLICKED)

func on_mouse_entered() -> void:
	if not card_ui.playable or card_ui.disabled:
		return

	card_ui.panel.set("theme_override_styles/panel", card_ui.HOVER_STYLE)

func on_mouse_exited() -> void:
	if not card_ui.playable or card_ui.disabled:
		return

	card_ui.panel.set("theme_override_styles/panel", card_ui.BASE_STYLE)
