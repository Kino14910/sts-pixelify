extends CardState

const MOUSE_Y_SNAPBACK_THRESHOLD = 138

func enter() -> void:
	if !card_ui.is_node_ready():
		await card_ui.ready

	card_ui.targets.clear()
	var offset = Vector2(-card_ui.size.x / 2, -card_ui.size.y)
	card_ui.animate_to_position(card_ui.get_parent().global_position + offset, 0.2)
	card_ui.drop_point_detector.monitoring = false
	
	Events.card_aim_started.emit(card_ui)
	card_ui.z_index = 1

func exit() -> void:
	Events.card_aim_ended.emit(card_ui)
	card_ui.z_index = 0

func on_input(event: InputEvent) -> void:
	var mouse_motion = event is InputEventMouseMotion
	var mouse_at_bottom = card_ui.get_global_mouse_position().y > MOUSE_Y_SNAPBACK_THRESHOLD

	if (mouse_motion and mouse_at_bottom) or event.is_action_pressed('right_mouse'):
		card_ui.targets.clear()
		transition_requested.emit(self, State.BASE)
	elif event.is_action_pressed('left_mouse') or event.is_action_released('left_mouse'):
		get_viewport().set_input_as_handled()
		transition_requested.emit(self, State.RELEASED)
