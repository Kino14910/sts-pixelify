# Player turn order:
# 1. START_OF_TURN Relics 
# 2. START_OF_TURN Powers
# 3. Draw Hand
# 4. End Turn 
# 5. END_OF_TURN Relics 
# 6. END_OF_TURN Powers
# 7. Discard Hand
class_name PlayerHandler
extends Node

const HAND_DRAW_INTERVAL = 0.2
const HAND_DISCARD_INTERVAL = 0.1

@export var relics: RelicHandler
@export var hand: Hand

var char_stats: CharacterStats

func _ready() -> void:
	Events.card_played.connect(_on_card_played)
	Events.draw_cards.connect(draw_cards)
	GameManager.player_handler = self
	
func start_battle(new_char_stats: CharacterStats) -> void:
	char_stats = new_char_stats
	char_stats.draw_pile = char_stats.deck.custom_duplicate()
	char_stats.draw_pile.shuffle()
	char_stats.discard = CardPile.new()
	char_stats.exhaust_pile = CardPile.new()
	relics.relics_activated.connect(_on_relics_activated)
	GameManager.player.power_handler.powers_applied.connect(_on_powers_applied)
	start_turn()


func start_turn() -> void:
	char_stats.block = 0
	char_stats.reset_energy()
	relics.activate_relics_by_type(Relic.Type.START_OF_TURN)


func end_turn() -> void:
	hand.disable_hand()
	relics.activate_relics_by_type(Relic.Type.END_OF_TURN)


func draw_card() -> void:
	reshuffle_deck_from_discard()
	if char_stats.draw_pile.empty() && char_stats.discard.empty():
		return
	var card: Card = char_stats.draw_pile.draw_card()
	hand.add_card(card)
	reshuffle_deck_from_discard()


func draw_cards(amount: int, is_start_of_turn_draw: bool = true) -> void:
	var tween = create_tween()
	for i in range(amount):
		tween.tween_callback(draw_card)
		tween.tween_interval(HAND_DRAW_INTERVAL)
	
	tween.finished.connect(
		func(): 
			hand.enable_hand()
			if is_start_of_turn_draw:
				Events.player_hand_drawn.emit()
	)


func discard_cards() -> void:
	if hand.is_empty():
		Events.player_hand_discarded.emit()
		return

	var tween = create_tween()
	for card_ui: CardUI in hand.get_children():
		tween.tween_callback(char_stats.discard.add_card.bind(card_ui.card))
		tween.tween_callback(hand.discard_card.bind(card_ui))
		tween.tween_interval(HAND_DISCARD_INTERVAL)
	
	tween.finished.connect(
		func():
			Events.player_hand_discarded.emit()
	)


func reshuffle_deck_from_discard() -> void:
	if not char_stats.draw_pile.empty():
		return

	while not char_stats.discard.empty():
		char_stats.draw_pile.add_card(char_stats.discard.draw_card())

	char_stats.draw_pile.shuffle()

func _on_card_played(card: Card) -> void:
	if card.type == Card.CardType.POWER:
		return
	
	if card.exhaust:
		char_stats.exhaust_pile.add_card(card)
		return
	
	char_stats.discard.add_card(card)


# 写出来自己都绷不住的逆天生命周期
func _on_powers_applied(type: Power.Type) -> void:
	match type:
		Power.Type.START_OF_TURN:
			draw_cards(char_stats.cards_per_turn, true)
		Power.Type.END_OF_TURN:
			discard_cards()


func _on_relics_activated(type: Relic.Type) -> void:
	match type:
		Relic.Type.START_OF_TURN:
			GameManager.player.power_handler.apply_powers_by_type(Power.Type.START_OF_TURN)
		Relic.Type.END_OF_TURN:
			GameManager.player.power_handler.apply_powers_by_type(Power.Type.END_OF_TURN)
