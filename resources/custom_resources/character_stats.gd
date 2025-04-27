class_name CharacterStats
extends Stats

@export_group("Visuals")
@export var character_name: String
@export_multiline var description: String
@export var portrait: Texture

@export_group("Gameplay Data")
@export var starting_deck: CardPile
@export var cardpool: CardPile
@export var cards_per_turn: int
@export var max_energy: int
@export var char_max_hp: int
@export var starting_relic: Relic

var energy: int: 
	set(value):
		energy = value
		stats_changed.emit()

var deck: CardPile
var discard: CardPile
var draw_pile: CardPile
var exhaust_pile: CardPile


func reset_energy() -> void:
	energy = max_energy

func take_damage(damage: int, damagetype: DamageAction.DamageType) -> void:
	var initial_health = health
	super.take_damage(damage, damagetype)
	if initial_health > health:
		Events.player_hit.emit()

func can_play_card(card: Card) -> bool:
	return energy >= card.cost

func instantiate() -> Resource:
	var instance: CharacterStats = self.duplicate()
	instance.max_health = instance.char_max_hp
	instance.health = instance.max_health
	instance.block = 0
	instance.reset_energy()
	instance.deck = instance.starting_deck.duplicate()
	instance.draw_pile = CardPile.new()
	instance.discard = CardPile.new()
	instance.exhaust_pile = CardPile.new()
	return instance
