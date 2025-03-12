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

@export_group("Card Attributes")
@export var id: String
@export var type: CardType
@export var target: CardTarget
@export var cost: int
@export var card_name: String
@export var damage: int
@export var block: int
@export var magicNumber: int
@export var rarity: CardRarity
#@export var tags: Array
#@export var color: CardColor

@export_group("Card Visuals")
@export var icon: Texture
@export_multiline var description: String
#@export_multiline var description_text: String

func is_single_target() -> bool:
	return target == CardTarget.ENEMY


func _get_targets(targets: Array[Node]) -> Array[Node]:
	if not targets:
		return []
		
	var tree = targets[0].get_tree()
	
	match target:
		CardTarget.SELF:
			return tree.get_nodes_in_group("player")
		CardTarget.ALL_ENEMIES:
			return tree.get_nodes_in_group("monster")
		CardTarget.ALL:
			return tree.get_nodes_in_group("player") + tree.get_nodes_in_group("monster")
		_:
			return []


func play(targets: Array[Node], character_stats: CharacterStats) -> void:
	Events.card_played.emit(self)
	
	character_stats.energy -= cost
	
	if is_single_target():
		apply_actions(targets)
	else:
		apply_actions(_get_targets(targets))


func apply_actions(targets: Array[Node]) -> void:
	pass

func get_default_description() -> String:
	return description
