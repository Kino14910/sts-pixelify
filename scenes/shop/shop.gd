class_name Shop
extends Control

const SHOP_CARD = preload('res://scenes/shop/shop_card.tscn')
const SHOP_RELIC = preload('res://scenes/shop/shop_relic.tscn')

@export var shop_relics: Array[Relic]
@export var char_stats: CharacterStats
@export var run_stats: RunStats
@export var relic_handler: RelicHandler
@onready var delete_card: VBoxContainer = %DeleteCard

@onready var char_cards: HBoxContainer = %Cards
@onready var colorless_cards: HBoxContainer = %ColorlessCards
@onready var relics: HBoxContainer = %Relics
@onready var potions: HBoxContainer = %Potions
@onready var shop_keeper_animation: AnimationPlayer = %ShopkeeperAnimation
@onready var modifier_handler: ModifierHandler = $ModifierHandler


func _ready() -> void:
	for shop_card: ShopCard in char_cards.get_children():
		shop_card.queue_free()
	
	for colorless_card: ShopCard in colorless_cards.get_children():
		colorless_card.queue_free()
	
	for shop_relic: ShopRelic in relics.get_children():
		shop_relic.queue_free()
		
	for shop_relic: ShopRelic in potions.get_children():
		shop_relic.queue_free()

	Events.shop_card_bought.connect(_on_shop_card_bought)
	Events.shop_relic_bought.connect(_on_shop_relic_bought)
	

func populate_shop() -> void:
	_generate_shop_cards()
	_generate_shop_relics()
	_generate_colorless_cards()
	_generate_shop_potions()


func _generate_shop_cards() -> void:
	var shop_card_array: Array[Card] = []
	var available_cards: Array[Card] = char_stats.cardpool.duplicate_cards()
	RNG.array_shuffle(available_cards)
	shop_card_array = available_cards.slice(0, 5)
	
	_generate_cards(shop_card_array, char_cards)

func _generate_colorless_cards() -> void:
	var colorless_array: Array[Card] = []
	var available_cards: Array[Card] = GameManager.colorless.duplicate_cards()
	RNG.array_shuffle(available_cards)
	colorless_array = available_cards.slice(0, 2)
	_generate_cards(colorless_array, colorless_cards)

func _generate_cards(cards, cardsContainer) -> void:
	for card: Card in cards:
		var shop_card = SHOP_CARD.instantiate() as ShopCard
		cardsContainer.add_child(shop_card)
		shop_card.card = card
		shop_card.gold_cost = _get_updated_shop_cost(shop_card.gold_cost)
		shop_card.update(run_stats)

		
func _generate_shop_relics() -> void:
	var shop_relics_array: Array[Relic] = []
	var available_relics = shop_relics.filter(
		func(relic: Relic):
			var can_appear = relic.can_appear_as_reward(char_stats)
			var already_had_it = relic_handler.has_relic(relic.id)
			return can_appear and not already_had_it
	)
	
	RNG.array_shuffle(available_relics)
	shop_relics_array = available_relics.slice(0, 3)
	
	for relic: Relic in shop_relics_array:
		var shop_relic = SHOP_RELIC.instantiate() as ShopRelic
		relics.add_child(shop_relic)
		shop_relic.relic = relic
		shop_relic.gold_cost = _get_updated_shop_cost(shop_relic.gold_cost)
		shop_relic.update(run_stats)

func _generate_shop_potions() -> void:
	pass
	
func _update_items() -> void:
	for shop_card: ShopCard in char_cards.get_children():
		shop_card.update(run_stats)
		
	for shop_colorless: ShopCard in colorless_cards.get_children():
		shop_colorless.update(run_stats)
	
	for shop_relic: ShopRelic in relics.get_children():
		shop_relic.update(run_stats)
		
	delete_card.update(run_stats)


func _update_item_costs() -> void:
	for shop_card: ShopCard in char_cards.get_children():
		shop_card.gold_cost = _get_updated_shop_cost(shop_card.gold_cost)
		shop_card.update(run_stats)
		
	for shop_colorless: ShopCard in colorless_cards.get_children():
		shop_colorless.gold_cost = _get_updated_shop_cost(shop_colorless.gold_cost)
		shop_colorless.update(run_stats)
		
	for shop_relic: ShopRelic in relics.get_children():
		shop_relic.gold_cost = _get_updated_shop_cost(shop_relic.gold_cost)
		shop_relic.update(run_stats)


func _get_updated_shop_cost(original_cost: int) -> int:
	return modifier_handler.get_modified_value(original_cost, Modifier.Type.SHOP_COST)


func _on_back_button_pressed() -> void:
	Events.shop_exited.emit()


func _on_shop_card_bought(card: Card, gold_cost: int) -> void:
	char_stats.deck.add_card(card)
	run_stats.gold -= gold_cost
	_update_items()


func _on_shop_relic_bought(relic: Relic, gold_cost: int) -> void:
	relic_handler.add_relic(relic)
	run_stats.gold -= gold_cost
	
	if relic is MembershipCard:
		var membership_card = relic as MembershipCard
		membership_card.add_shop_modifier(self)
		_update_item_costs()
	else:
		_update_items()


func _on_delete_card_btn_pressed() -> void:
	pass
