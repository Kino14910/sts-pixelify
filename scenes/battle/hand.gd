class_name Hand
extends Node2D

const card_scene = preload('res://scenes/card_ui/card_ui.tscn')


@export var char_stats: CharacterStats
@export var spread_curve: Curve
@export var rotation_curve: Curve
@export var height_curve: Curve

func _ready() -> void:
	displayCards()


func add_card(card: Card) -> void:
	var new_card_ui = card_scene.instantiate()
	add_child(new_card_ui)
	new_card_ui.card = card
	new_card_ui.char_stats = char_stats
	new_card_ui.player_modifiers = GameManager.player.modifier_handler
	if not char_stats.can_play_card(card):
		new_card_ui.disable_card(card)
	new_card_ui.begin_play()


func displayCards():
	var current_card_count = get_child_count()
	var hand_width = (current_card_count - 1) * 10
	
	for card in get_children():
		card.target_position = -card.size / 2
		var hand_ratio = 0.5

		if current_card_count > 1:
			hand_ratio = float(card.get_index()) / float((get_child_count() - 1))
			card.target_position.x = spread_curve.sample(hand_ratio) * hand_width
			card.target_position += height_curve.sample(hand_ratio) * Vector2.UP * current_card_count * 1.2
			
			card.target_rotation = rotation_curve.sample(hand_ratio) * current_card_count * 0.03


func discard_card(card: CardUI) -> void:
	card.get_parent().remove_child(card)
	char_stats.discard.add_card(card.card)
	card.queue_free()


func exhaust_card(card: CardUI) -> void:
	card.get_parent().remove_child(card)
	char_stats.exhaust_pile.add_card(card.card)
	card.queue_free()


func enable_hand() -> void:
	for card: CardUI in get_children():
		card.disabled = false


func disable_hand() -> void:
	for card: CardUI in get_children():
		card.disabled = true


func _on_child_order_changed() -> void:
	displayCards()


func is_empty() -> bool:
	return get_child_count() == 0
