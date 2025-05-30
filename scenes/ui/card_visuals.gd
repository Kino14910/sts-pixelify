class_name CardVisuals
extends Control

@onready var panel: Panel = $Panel
@onready var cost: Label = $CostIcon/Cost
@onready var icon: TextureRect = $Icon
@onready var banner: ColorRect = $Banner
@onready var card_name: Label = $Banner/CardName
@onready var description: RichTextLabel = $Description


@export var card: Card:
	set(value):
		if not is_node_ready():
			await ready
		
		card = value
		cost.text = str(card.cost)
		icon.texture = card.icon
		card_name.text = card.card_name
		description.text = card.get_default_description()
		banner.color = Card.RARITY_COLORS[card.rarity]

@export var pos: Vector2 = Vector2.ZERO
@export var rot: float
@export var anim_speed: float = 100.0

func _process(delta: float) -> void:
	position = lerp(position, pos, anim_speed * delta)
	rotation = lerp(rotation, rot, anim_speed * delta)
