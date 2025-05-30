class_name CardPile
extends Resource

signal card_pile_size_changed(cards_amount)

@export var cards: Array[Card] = []
@export var card_type: String = ''


func empty() -> bool:
	return cards.is_empty()


func draw_card() -> Card:
	var card = cards.pop_front()
	card_pile_size_changed.emit(cards.size())
	return card


func add_cards_by_path(path) -> Array[Card]:
	# godot没有泛型，只能这样写
	var arr: Array[Card]
	for card in Utils.load_res_from_dir('res://scripts/cards/' + path+ '/'):
		if card is Card && card.rarity != Card.CardRarity.BASIC:
			arr.append(card as Card)
	cards = arr
	card_pile_size_changed.emit(cards.size())
	return arr


func add_card(card: Card) -> void:
	cards.append(card)
	card_pile_size_changed.emit(cards.size())


func shuffle() -> void:
	RNG.array_shuffle(cards)


func clear() -> void:
	cards.clear()
	card_pile_size_changed.emit(cards.size())


# Godot issue: 
# https://github.com/godotengine/godot/issues/74918
func duplicate_cards() -> Array[Card]:
	var new_array: Array[Card] = []
	
	if card_type:
		add_cards_by_path(card_type)
		
	for card: Card in cards:
		new_array.append(card.duplicate())
	
	return new_array


# Godot issue: 
# https://github.com/godotengine/godot/issues/74918
func custom_duplicate() -> CardPile:
	var new_card_pile = CardPile.new()
	new_card_pile.cards = duplicate_cards()
	return new_card_pile


func _to_string() -> String:
	var _card_strings: PackedStringArray = []
	for i in range(cards.size()):
		_card_strings.append("%s: %s" % [i+1, cards[i].id])
	return "\n".join(_card_strings)
