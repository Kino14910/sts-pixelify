extends Relic

@export var skills_required = 3
@export var damage = 5

var relic_ui: RelicUI
var skills_this_turn: int


func initialize_relic(owner: RelicUI) -> void:
	relic_ui = owner
	Events.player_hand_drawn.connect(_reset)
	Events.map_exited.connect(_reset.unbind(1))
	Events.card_played.connect(_on_card_played)


func deactivate_relic(_owner: RelicUI) -> void:
	Events.player_hand_drawn.disconnect(_reset)
	Events.map_exited.disconnect(_reset)
	Events.card_played.disconnect(_on_card_played)


func _reset() -> void:
	skills_this_turn = 0


func _on_card_played(card: Card) -> void:
	if card.type != Card.CardType.SKILL:
		return
	
	skills_this_turn += 1
	
	if skills_this_turn % skills_required == 0:
		var monsters = relic_ui.get_tree().get_nodes_in_group("monster")
		var damage_action = DamageAction.new(monsters, damage)
		damage_action.receiver_modifier_type = Modifier.Type.NO_MODIFIER
		
		relic_ui.flash()
		skills_this_turn = 0
