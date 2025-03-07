class_name RunStats
extends Resource

signal gold_changed

const STARTING_GOLD := 70
const BASE_CARD_REWARDS := 3
const BASE_COMMON_WEIGHT := 60
const BASE_UNCOMMON_WEIGHT := 37
const BASE_RARE_WEIGHT := 3

@export var gold := STARTING_GOLD: 
	set(value):
		gold = value
		gold_changed.emit()
@export var card_rewards := BASE_CARD_REWARDS
@export_range(0, 100) var common_weight := BASE_COMMON_WEIGHT
@export_range(0, 100) var uncommon_weight := BASE_UNCOMMON_WEIGHT
@export_range(0, 100) var rare_weight := BASE_RARE_WEIGHT


func reset_weights() -> void:
	common_weight = BASE_COMMON_WEIGHT
	uncommon_weight = BASE_UNCOMMON_WEIGHT
	rare_weight = BASE_RARE_WEIGHT
