class_name Hand
extends Node2D

const card_scene = preload('res://scenes/card_ui/card_ui.tscn')

#@export var player: Player
@export var character_stats: CharacterStats
#@onready var hand: Node2D = $Hand
@export var spread_curve: Curve
@export var rotation_curve: Curve
@export var height_curve: Curve
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.card_played.connect(displayCards)
	displayCards()


func add_card(card: Card) -> void:
	var new_card_ui = card_scene.instantiate()
	add_child(new_card_ui)
	new_card_ui.card = card
	new_card_ui.character_stats = character_stats
	#new_card_ui.player_modifiers = player.modifier_handler


func displayCards():
	var current_card_count = get_child_count()
	var hand_width = (current_card_count - 1) * 10
	
	for card in get_children():
		card.target_position = -card.size / 2
		var hand_ratio = 0.5
		
		# var destination = global_transform

		if current_card_count > 1:
			hand_ratio = float(card.get_index()) / float((get_child_count() - 1))
			card.target_position.x = spread_curve.sample(hand_ratio) * hand_width
			card.target_position += height_curve.sample(hand_ratio) * Vector2.UP * current_card_count * 1.2
			
			card.target_rotation = rotation_curve.sample(hand_ratio) * current_card_count * 0.03


func discard_card(card: CardUI) -> void:
	card.queue_free()


func enable_hand() -> void:
	for card: CardUI in get_children():
		card.disabled = false
		#if card.is_hovered():
			#card.card_state_machine.on_mouse_entered()


func disable_hand() -> void:
	for card: CardUI in get_children():
		card.disabled = true
