class_name Run
extends Node


const BATTLE_SCENE = preload('res://scenes/battle/battle.tscn')
const BATTLE_REWARD_SCENE = preload('res://scenes/battle_reward/battle_reward.tscn')
const BATTLE_OVER_PANEL = preload('res://scenes/ui/battle_over_panel.tscn')
const CAMPFIRE_SCENE = preload('res://scenes/campfire/campfire.tscn')
const SHOP_SCENE = preload('res://scenes/shop/shop.tscn')
const TREASURE_SCENE = preload('res://scenes/treasure/treasure.tscn')
const MAIN_MENU_PATH = 'res://scenes/ui/main_menu.tscn'


@export var open_tutorial: bool

@export var run_startup: RunStartup


@onready var map: Map = $Map
@onready var current_view: Node = $CurrentView

@onready var gold_ui: GoldUI = %GoldUI
@onready var health_ui: HealthUI = %HealthUI
@onready var floor_ui: FloorUI = %FloorUI
@onready var potions_ui: PotionUI = %PotionsUI
@onready var deck_button: CardPileOpener = %DeckButton
@onready var deck_view: CardPileView = %DeckView
@onready var pause_menu: PauseMenu = $PauseMenu

@onready var relic_handler: RelicHandler = %RelicHandler
@onready var relic_tooltip: RelicTooltip = %RelicTooltip

@onready var battle_button: Button = %BattleButton
@onready var campfire_button: Button = %CampfireButton
@onready var map_button: Button = %MapButton
@onready var rewards_button: Button = %RewardsButton
@onready var shop_button: Button = %ShopButton
@onready var treasure_button: Button = %TreasureButton
@onready var tutorial: CanvasLayer = $Tutorial
@onready var battle_tutorial: CanvasLayer = $BattleTutorial
@onready var player: Player = %Player


var stats: RunStats
var char_stats: CharacterStats
var save_data: SaveGame
var once: bool = false


func _ready() -> void:
	if not run_startup:
		return
	
	pause_menu.save_and_quit.connect(
		func(): 
			get_tree().change_scene_to_file(MAIN_MENU_PATH)
	)
	
	GameManager.run = self
	
	
	match run_startup.type:
		RunStartup.Type.NEW_RUN:
			char_stats = run_startup.picked_character.instantiate()
			_start_run()
		RunStartup.Type.CONTINUED_RUN:
			_load_run()


func _start_run() -> void:
	stats = RunStats.new()
	
	_setup_event_connections()
	_setup_top_bar()
	
	map.generate_new_map()
	map.unlock_floor(0)
	if open_tutorial:
		tutorial.visible = true
	
	save_data = SaveGame.new()
	_save_run(true)
	
	GameManager.player = self.player


func _change_view(scene: PackedScene) -> Node:
	if current_view.get_child_count() > 0:
		current_view.get_child(0).queue_free()
	
	get_tree().paused = false
	var new_view = scene.instantiate()
	current_view.add_child(new_view)
	map.hide_map()
	
	stats.floor += 1
	player.visible = false
	
	return new_view


func _show_map() -> void:
	if current_view.get_child_count() > 0:
		current_view.get_child(0).queue_free()

	map.show_map()
	map.unlock_next_rooms()
	
	_save_run(true)


func _setup_event_connections() -> void:
	Events.battle_won.connect(_on_battle_won)
	Events.battle_reward_exited.connect(_show_map)
	Events.campfire_exited.connect(_show_map)
	Events.map_exited.connect(_on_map_exited)
	Events.shop_exited.connect(_show_map)
	Events.treasure_room_exited.connect(_on_treasure_room_exited)
	Events.event_room_exited.connect(_show_map)
	
	battle_button.pressed.connect(_change_view.bind(BATTLE_SCENE))
	campfire_button.pressed.connect(_change_view.bind(CAMPFIRE_SCENE))
	map_button.pressed.connect(_show_map)
	rewards_button.pressed.connect(_change_view.bind(BATTLE_REWARD_SCENE))
	shop_button.pressed.connect(_change_view.bind(SHOP_SCENE))
	treasure_button.pressed.connect(_change_view.bind(TREASURE_SCENE))


func _on_map_exited(room: Room) -> void:
	_save_run(false)
	
	match room.type:
		Room.Type.MONSTER:
			_on_battle_room_entered(room)
		Room.Type.TREASURE:
			_on_treasure_room_entered()
		Room.Type.CAMPFIRE:
			_on_campfire_entered()
		Room.Type.SHOP:
			_on_shop_entered()
		Room.Type.BOSS:
			_on_battle_room_entered(room)
		Room.Type.EVENT:
			_on_event_room_entered(room)


func _save_run(was_on_map: bool) -> void:
	save_data.rng_seed = RNG.instance.seed
	save_data.rng_state = RNG.instance.state
	save_data.run_stats = stats
	save_data.char_stats = char_stats
	save_data.current_deck = char_stats.deck
	save_data.current_health = char_stats.health
	save_data.relics = relic_handler.get_all_relics()
	save_data.last_room = map.last_room
	save_data.map_data = map.map_data.duplicate()
	save_data.floors_climbed = map.floors_climbed
	save_data.was_on_map = was_on_map
	save_data.save_data()


func _load_run() -> void:
	save_data = SaveGame.load_data()
	assert(save_data, "Couldn't load last save")
	
	RNG.set_from_save_data(save_data.rng_seed, save_data.rng_state)
	stats = save_data.run_stats
	char_stats = save_data.char_stats
	char_stats.deck = save_data.current_deck
	char_stats.health = save_data.current_health
	relic_handler.add_relics(save_data.relics)
	_setup_top_bar()
	_setup_event_connections()
	
	map.load_map(save_data.map_data, save_data.floors_climbed, save_data.last_room)
	if save_data.last_room and not save_data.was_on_map:
		_on_map_exited(save_data.last_room)


func _setup_top_bar():
	char_stats.stats_changed.connect(health_ui._update_health.bind(char_stats))
	health_ui._update_health(char_stats)
	gold_ui.run_stats = stats
	floor_ui.run_stats = stats
	deck_button.card_pile = char_stats.deck
	deck_view.card_pile = char_stats.deck
	deck_button.pressed.connect(deck_view.show_current_view.bind('Deck'))

	relic_handler.add_relic(char_stats.starting_relic)
	Events.relic_tooltip_requested.connect(relic_tooltip.show_tooltip)
	Events.relic_tooltip_hide.connect(relic_tooltip.hide_tooltip)


func _show_regular_battle_rewards() -> void:
	var reward_scene = _change_view(BATTLE_REWARD_SCENE) as BattleReward
	reward_scene.run_stats = stats
	reward_scene.char_stats = char_stats

	reward_scene.add_gold_reward(map.last_room.battle_stats.roll_gold_reward())
	reward_scene.add_card_reward()


func _on_battle_room_entered(room: Room) -> void:
	var battle_scene: Battle = _change_view(BATTLE_SCENE) as Battle
	battle_scene.char_stats = char_stats
	battle_scene.battle_stats = room.battle_stats
	battle_scene.relics = relic_handler
	battle_scene.start_battle()
	player.stats = char_stats
	player.visible = true
	player.animated_sprite_2d.play('default')
	
	GameManager.room = room 
	if !once && open_tutorial:
		once = true
		battle_tutorial.visible = true


func _on_treasure_room_entered() -> void:
	var treasure_scene = _change_view(TREASURE_SCENE) as Treasure
	treasure_scene.relic_handler = relic_handler
	treasure_scene.char_stats = char_stats
	treasure_scene.generate_relic()


func _on_treasure_room_exited(relic: Relic) -> void:
	var reward_scene = _change_view(BATTLE_REWARD_SCENE) as BattleReward
	reward_scene.run_stats = stats
	reward_scene.char_stats = char_stats
	reward_scene.relic_handler = relic_handler
	reward_scene.add_relic_reward(relic)


func _on_campfire_entered() -> void:
	var campfire = _change_view(CAMPFIRE_SCENE) as Campfire
	campfire.char_stats = char_stats


func _on_shop_entered() -> void:
	var shop = _change_view(SHOP_SCENE) as Shop
	shop.char_stats = char_stats
	shop.run_stats = stats
	shop.relic_handler = relic_handler
	Events.shop_entered.emit(shop)
	shop.populate_shop()


func _on_event_room_entered(room: Room) -> void:
	var event_room = _change_view(room.event_scene) as EventRoom
	event_room.char_stats = char_stats
	event_room.run_stats = stats
	event_room.setup()


func _on_battle_won() -> void:
	if map.floors_climbed == MapGenerator.FLOORS - 1:
		var win_screen = _change_view(BATTLE_OVER_PANEL) as BattleOverPanel
		SaveGame.delete_data()
	else:
		_show_regular_battle_rewards()


func _on_tutorial_button_pressed() -> void:
	tutorial.visible = false


func _on_battle_tutorial_button_pressed() -> void:
	battle_tutorial.visible = false
