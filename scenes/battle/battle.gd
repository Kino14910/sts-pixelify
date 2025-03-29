class_name Battle
extends Node2D

@export var battle_stats: BattleStats
@export var char_stats: CharacterStats
@export var music: AudioStream
@export var relics: RelicHandler

@onready var battle_ui: BattleUI = $BattleUI
@onready var monster_handler: MonsterHandler = $MonsterHandler
@onready var player: Player = $Player
@onready var player_handler: PlayerHandler = $PlayerHandler


func _ready() -> void:
	
	Events.monster_turn_ended.connect(_on_monster_turn_ended)
	
	Events.player_turn_ended.connect(player_handler.end_turn)
	Events.player_hand_discarded.connect(monster_handler.start_turn)
	Events.player_died.connect(_on_player_died)


func start_battle() -> void:
	get_tree().paused = false
	MusicPlayer.play(music, true)
	
	battle_ui.char_stats = char_stats
	player.stats = char_stats
	player_handler.relics = relics
	monster_handler.setup_monsters(battle_stats)
	monster_handler.reset_monster_actions()
	
	relics.relics_activated.connect(_on_relics_activated)
	relics.activate_relics_by_type(Relic.Type.START_OF_COMBAT)


func _on_player_died() -> void:
	Events.battle_over_screen_requested.emit('Game over!', BattleOverPanel.Type.LOSE)

func _on_monster_turn_ended() -> void:
	player_handler.start_turn()
	monster_handler.reset_monster_actions()

func _on_monsters_child_order_changed() -> void:
	if monster_handler.get_child_count() == 0 and is_instance_valid(relics):
		relics.activate_relics_by_type(Relic.Type.END_OF_COMBAT)
		
func _on_relics_activated(type: Relic.Type) -> void:
	match type:
		Relic.Type.START_OF_COMBAT:
			player_handler.start_battle(char_stats)
			battle_ui.initialize_card_pile_ui()
		Relic.Type.END_OF_COMBAT:
			Events.battle_over_screen_requested.emit("Victorious!", BattleOverPanel.Type.WIN)
