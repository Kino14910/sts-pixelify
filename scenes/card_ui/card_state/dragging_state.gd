extends CardState

var min_drag_time_elapsed: bool

func enter() -> void:
	card_ui.card_visuals.panel.set('theme_override_styles/panel', card_ui.DRAG_STYLE)
	Events.card_drag_started.emit(card_ui)
	# 通过创建一个计时器来检测拖拽的最小时间，防止同时触发点击和释放
	min_drag_time_elapsed = false
	get_tree().create_timer(0.05).timeout.connect(func(): 
		min_drag_time_elapsed = true
	)
	
func exit() -> void:
	Events.card_drag_ended.emit(card_ui)


func on_input(event: InputEvent) -> void:
	var is_single_target = card_ui.card.is_single_target()
	var mouse_motion = event is InputEventMouseMotion
	var cancel = event.is_action_pressed('right_mouse')
	var confirm = event.is_action_pressed('left_mouse') or event.is_action_released('left_mouse')
	
	if mouse_motion and is_single_target and card_ui.targets.size() > 0:
		transition_requested.emit(self, CardState.State.AIMING)
		return

	if mouse_motion:
		card_ui.global_position = card_ui.get_global_mouse_position() - card_ui.pivot_offset
	
	if cancel:
		transition_requested.emit(self, CardState.State.BASE)
	elif confirm and min_drag_time_elapsed:
		get_viewport().set_input_as_handled()
		transition_requested.emit(self, CardState.State.RELEASED)
