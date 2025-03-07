class_name CardRewards
extends ColorRect

signal card_reward_selected(card: Card)

const CARD_MENU_UI = preload("res://scenes/ui/card_menu_ui.tscn")

@export var rewards: Array[Card]:
	set(value):
		rewards = value
		
		if not is_node_ready():
			await ready
			
		_clear_rewards()
		for card: Card in rewards:
			var new_card = CARD_MENU_UI.instantiate()
			cards.add_child(new_card)
			new_card.card = card
			new_card.select_card.connect(_select_card)

@onready var cards: HBoxContainer = %Cards
@onready var skip_card_reward: Button = %SkipCardReward

var selected_card: Card


func _ready() -> void:
	_clear_rewards()
	
	skip_card_reward.pressed.connect(
		func(): 
			card_reward_selected.emit(null)
			queue_free()
	)


func _clear_rewards() -> void:
	for card: Node in cards.get_children():
		card.queue_free()
	selected_card = null


func _select_card(card: Card) -> void:
	selected_card = card
	card_reward_selected.emit(selected_card)
	queue_free()
