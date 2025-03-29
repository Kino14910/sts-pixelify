class_name CardStateMachine
extends Node

@export var initial_state: CardState
var current_state: CardState
var target_state: CardState

var states: Dictionary = {}

func init(card: CardUI) -> void:
	for child in get_children():
		if child is CardState:
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.card_ui = card
	
	if initial_state:
		current_state = initial_state
		current_state.enter()
	
func on_input(event: InputEvent) -> void:
	current_state.on_input(event)

func on_gui_input(event: InputEvent) -> void:
	current_state.on_gui_input(event)

func on_mouse_entered() -> void:
	current_state.on_mouse_entered()

func on_mouse_exited() -> void:
	current_state.on_mouse_exited()

func _on_transition_requested(from: CardState, to: CardState.State) -> void:
	if from != current_state:
		return
	target_state = states[to]
	if !target_state:
		return
	
	# if current_state:
	current_state.exit()
	
	current_state = target_state
	current_state.enter()
	current_state.post_enter()
	
