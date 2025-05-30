class_name BattleReward
extends Control

const CARD_REWARDS = preload('res://scenes/ui/card_rewards.tscn')
const REWARD_BUTTON = preload('res://scenes/ui/reward_button.tscn')
@export var GOLD_ICON: CompressedTexture2D
const GOLD_TEXT = '%s gold'
@export var CARD_ICON: CompressedTexture2D
const CARD_TEXT = 'Add New Card'

@export var run_stats: RunStats
@export var char_stats: CharacterStats
@export var relic_handler: RelicHandler

@onready var rewards: VBoxContainer = %Rewards

var card_reward_total_weight = 0
var card_rarity_weights = {
	Card.CardRarity.COMMON: 0,
	Card.CardRarity.UNCOMMON: 0,
	Card.CardRarity.RARE: 0
}


func _ready() -> void:
	for node: Node in rewards.get_children():
		node.queue_free()

func add_gold_reward(amount: int) -> void:
	var gold_reward = REWARD_BUTTON.instantiate()
	gold_reward.reward_icon = GOLD_ICON
	gold_reward.reward_text = GOLD_TEXT % amount
	gold_reward.pressed.connect(_on_gold_reward_taken.bind(amount))
	rewards.add_child.call_deferred(gold_reward)


func add_card_reward() -> void:
	var card_reward = REWARD_BUTTON.instantiate()
	card_reward.reward_icon = CARD_ICON
	card_reward.reward_text = CARD_TEXT
	card_reward.pressed.connect(_show_card_rewards)
	rewards.add_child.call_deferred(card_reward)


func add_relic_reward(relic: Relic) -> void:
	if not relic:
		return

	var relic_reward = REWARD_BUTTON.instantiate()
	relic_reward.reward_icon = relic.icon
	relic_reward.reward_text = relic.relic_name
	relic_reward.pressed.connect(_on_relic_reward_taken.bind(relic))
	rewards.add_child.call_deferred(relic_reward)


func _show_card_rewards() -> void:
	if not run_stats or not char_stats:
		return
	
	var card_rewards = CARD_REWARDS.instantiate() as CardRewards
	add_child(card_rewards)
	card_rewards.card_reward_selected.connect(_on_card_reward_taken)
	
	var card_reward_array: Array[Card] = []
	var available_cards: Array[Card] = char_stats.cardpool.duplicate_cards()
	
	# 从奖励卡池中根据稀有度获取对应的奖励
	for i in run_stats.card_rewards:
		_setup_card_chances()
		var roll = RNG.instance.randf_range(0, card_reward_total_weight)

		for rarity: Card.CardRarity in card_rarity_weights:
			if card_rarity_weights[rarity] > roll:
				_modify_weights(rarity)
				var picked_card = _get_random_available_card(available_cards, rarity)
				card_reward_array.append(picked_card)
				# 保证不会出现两张一样的奖励
				available_cards.erase(picked_card)
				break

	card_rewards.rewards = card_reward_array
	card_rewards.show()


func _setup_card_chances() -> void:
	card_reward_total_weight = run_stats.common_weight + run_stats.uncommon_weight + run_stats.rare_weight
	card_rarity_weights[Card.CardRarity.COMMON] = run_stats.common_weight
	card_rarity_weights[Card.CardRarity.UNCOMMON] = run_stats.common_weight + run_stats.uncommon_weight
	card_rarity_weights[Card.CardRarity.RARE] = card_reward_total_weight


# 如果拿到稀有卡，重置稀有度权重，没拿到则稀有度权重至少+3
func _modify_weights(rarity_rolled: Card.CardRarity) -> void:
	if rarity_rolled == Card.CardRarity.RARE:
		run_stats.rare_weight = RunStats.BASE_RARE_WEIGHT
	else:
		run_stats.rare_weight = clamp(run_stats.rare_weight + 3, run_stats.BASE_RARE_WEIGHT, 50)


func _get_random_available_card(available_cards: Array[Card], with_rarity: Card.CardRarity) -> Card:
	var all_possible_cards = available_cards.filter(
		func(card: Card):
			return card.rarity == with_rarity
	)
	return RNG.array_pick_random(all_possible_cards)


func _on_gold_reward_taken(amount: int) -> void:
	if not run_stats:
		return
	
	run_stats.gold += amount


func _on_card_reward_taken(card: Card) -> void:
	if not char_stats or not card:
		return
	char_stats.deck.add_card(card)


func _on_relic_reward_taken(relic: Relic) -> void:
	if not relic or not relic_handler:
		return
		
	relic_handler.add_relic(relic)


func _on_back_button_pressed() -> void: 
	Events.battle_reward_exited.emit()
