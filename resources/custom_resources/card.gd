class_name Card
extends Resource

enum CardTags {
	HEALING,
	STRIKE,
	EMPTY,
	STARTER_DEFEND,
	STARTER_STRIKE
}

enum CardType {
	ATTACK,
	SKILL,
	POWER,
	STATUS,
	CURSE
}

enum CardRarity {
	BASIC,
	SPECIAL,
	COMMON,
	UNCOMMON,
	RARE,
	CURSE
}

enum CardColor {
	RED,
	GREEN,
	BLUE,
	PURPLE,
	COLORLESS,
	CURSE
}

enum CardTarget {
	ENEMY,
	ALL_ENEMIES,
	SELF,
	NONE,
	ALL
}

const RARITY_COLORS = {
	CardRarity.BASIC: Color.GRAY,
	CardRarity.SPECIAL: Color.GRAY,
	CardRarity.COMMON: Color.GRAY,
	CardRarity.UNCOMMON: Color.CORNFLOWER_BLUE,
	CardRarity.RARE: Color.GOLD,
	CardRarity.CURSE: Color.DIM_GRAY,
}

const COLOR_UP = "#4CAF50"   # 增强绿色
const COLOR_DOWN = "#F44336" # 削弱红色
const COLOR_DEFAULT = "#FFFFFF" # 默认白色

@export_group('Card Attributes')
@export var id: String
@export var type: CardType
@export var target: CardTarget
@export var cost: int
@export var card_name: String
@export var damage: int
@export var block: int
@export var magicNumber: int
@export var rarity: CardRarity
@export var exhaust: bool = false
@export var ethereal: bool = false
@export var innate: bool = false
@export var tags: Array[String]
@export var color: CardColor
var modified_damage: int
var modified_block: int
var modified_magicNumber: int

@export_group('Card Visuals')
@export var icon: Texture
@export_multiline var description: String
#@export_multiline var updated_description: String

func is_single_target() -> bool:
	return target == CardTarget.ENEMY


func _get_targets(targets: Array[Node]) -> Array[Node]:
	if not targets:
		return []
	
	var tree = targets[0].get_tree()
	
	match target:
		CardTarget.SELF:
			return tree.get_nodes_in_group('player')
		CardTarget.ALL_ENEMIES:
			return tree.get_nodes_in_group('monster')
		CardTarget.ALL:
			return tree.get_nodes_in_group('player') + tree.get_nodes_in_group('monster')
		_:
			return []


func play(targets: Array[Node], char_stats: CharacterStats) -> void:
	Events.card_played.emit(self)
	
	char_stats.energy -= cost
	
	if is_single_target():
		apply_actions(targets)
	else:
		apply_actions(_get_targets(targets))


func apply_actions(targets: Array[Node]) -> void:
	pass

func get_default_description() -> String:
	var desc = description.replace('!D!', str(damage))\
		.replace('!B!', str(block))\
		.replace('!M!', str(magicNumber))
	
	return Utils.get_keywords_color(desc)


func get_updated_description(_player_modifiers: ModifierHandler) -> String:
	var desc = description.replace('!D!', _get_colored_value(_player_modifiers, 'damage'))\
		.replace('!B!', _get_colored_value(_player_modifiers, 'block'))\
		.replace('!M!', _get_colored_value(_player_modifiers, 'magicNumber'))
	
	return Utils.get_keywords_color(desc)


func _get_colored_value(player_modifiers: ModifierHandler, stat: String) -> String:
	var base = get(stat)
	var modifier = Modifier.Type.NO_MODIFIER
	match stat:
		'damage': modifier = Modifier.Type.DMG_DEALT
		'block': modifier = Modifier.Type.BLOCK_GAIN
	
	var current = player_modifiers.get_modified_value(base, modifier)

	if current > base:
		return '[color=%s]%d[/color]' % [COLOR_UP, current]
	elif current < base:
		return '[color=%s]%d[/color]' % [COLOR_DOWN, current]
	else:
		return '[color=%s]%d[/color]' % [COLOR_DEFAULT, current]
