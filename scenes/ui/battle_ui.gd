class_name BattleUI
extends CanvasLayer

@export var character_stats: CharacterStats: 
	set(value):
		character_stats = value
		energy_ui.character_stats = character_stats
		hand.character_stats = character_stats

@onready var hand: Hand = $Hand
@onready var energy_ui: EnergyUI = $EnergyUI
@onready var end_turn_button: Button = %EndTurnButton
@onready var draw_pile_button: CardPileOpener = %DrawPile
@onready var discard_pile_button: CardPileOpener = %DiscardPile
@onready var draw_pile_view: CardPileView = %DrawPileView
@onready var discard_pile_view: CardPileView = %DiscardPileView


func _ready() -> void:
	Events.player_hand_drawn.connect(_on_player_hand_drawn)
	end_turn_button.pressed.connect(_on_end_turn_button_pressed)
	draw_pile_button.pressed.connect(draw_pile_view.show_current_view.bind("Draw Pile", true))
	discard_pile_button.pressed.connect(discard_pile_view.show_current_view.bind("Discard Pile"))


func initialize_card_pile_ui() -> void:
	draw_pile_button.card_pile = character_stats.draw_pile
	draw_pile_view.card_pile = character_stats.draw_pile
	discard_pile_button.card_pile = character_stats.discard
	discard_pile_view.card_pile = character_stats.discard


func _on_player_hand_drawn() -> void:
	end_turn_button.disabled = false


func _on_end_turn_button_pressed() -> void:
	end_turn_button.disabled = true
	Events.player_turn_ended.emit()
