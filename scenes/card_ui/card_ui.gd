class_name CardUI
extends Control

# signal reparent_requested(which: CardUI)

const DRAG_STYLE = preload('res://scenes/card_ui/dragging_stylebox.tres')
const HOVER_STYLE = preload('res://scenes/card_ui/hover_stylebox.tres')
const BASE_STYLE = preload('res://scenes/card_ui/base_stylebox.tres')
const USE_STYLE = preload('res://scenes/card_ui/use_stylebox.tres')

const ANIM_SPEED = 10

@export var card: Card:
	set(value):
		if not is_node_ready():
			await ready
		card = value
		card_visuals.card = card
		
@export var character_stats: CharacterStats: 
	set(value):
		character_stats = value
		character_stats.stats_changed.connect(_on_character_stats_changed)
		#_on_character_stats_changed()


@export var player_modifiers: ModifierHandler

@onready var card_visuals: CardVisuals = $CardVisuals
@onready var drop_point_detector: Area2D = $DropPointDetector
@onready var card_state_machine: CardStateMachine = $CardStateMachine
@onready var targets: Array[Node] = []

var parent: Control
var tween: Tween

var target_rotation = rotation
var target_position = position

var playable = true: 
	set(value):
		playable = value
		if not playable:
			card_visuals.cost.add_theme_color_override("font_color", Color.RED)
			card_visuals.icon.modulate = Color(1, 1, 1, 0.5)
		else:
			card_visuals.cost.remove_theme_color_override("font_color")
			card_visuals.icon.modulate = Color(1, 1, 1, 1)
var disabled = false

func _ready() -> void:
	Events.card_drag_started.connect(_on_card_drag_or_aiming_started)
	Events.card_aim_started.connect(_on_card_drag_or_aiming_started)
	Events.card_drag_ended.connect(_on_card_drag_or_aim_ended)
	Events.card_aim_ended.connect(_on_card_drag_or_aim_ended)
	card_state_machine.init(self)

func _process(delta: float) -> void:
	if card_state_machine.current_state.state == CardState.State.BASE:
		position = lerp(position, target_position, ANIM_SPEED * delta)
		rotation = lerp(rotation, target_rotation, ANIM_SPEED * delta)
	else:
		rotation = lerp(rotation, 0.0, ANIM_SPEED * delta)

func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)


func animate_to_position(target: Vector2, duration: float) -> void:
	tween = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, 'global_position', target, duration)


func play() -> void:
	if not card:
		return
	
	card.play(targets, character_stats, player_modifiers)
	queue_free()
	

func get_active_monster_modifiers() -> ModifierHandler:
	if targets.is_empty() or targets.size() > 1 or not targets[0] is Monster:
		return null
	
	return targets[0].modifier_handler

func request_description() -> void:
	var monster_modifiers = get_active_monster_modifiers()
	var updated_description = card.get_updated_description(player_modifiers, monster_modifiers)
	card_visuals.description.text = updated_description


	
func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)

func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()

func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()


func _on_drop_point_detector_area_entered(area: Area2D) -> void:
	if !targets.has(area):
		targets.append(area)
		
	if card.target == card.CardTarget.SELF:
		Events.card_aim_self_started.emit()
	
	
	card_visuals.panel.set("theme_override_styles/panel", USE_STYLE)

	
func _on_drop_point_detector_area_exited(area: Area2D) -> void:
	targets.erase(area)
	
	Events.card_aim_self_ended.emit()
	card_visuals.panel.set("theme_override_styles/panel", DRAG_STYLE)


func _on_card_drag_or_aiming_started(used_card: CardUI) -> void:
	if used_card == self:
		return
	
	disabled = true


func _on_card_drag_or_aim_ended(_card: CardUI) -> void:
	disabled = false
	playable = character_stats.can_play_card(card)
	
func disable_card(card: Card):
	disabled = true
	playable = character_stats.can_play_card(card)
	
func _on_character_stats_changed() -> void:
	playable = character_stats.can_play_card(card)
