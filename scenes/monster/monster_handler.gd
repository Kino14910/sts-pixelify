class_name MonsterHandler
extends Node2D

var acting_monsters: Array[Monster] = []


func _ready() -> void:
	Events.monster_died.connect(_on_monster_died)
	Events.monster_action_completed.connect(_on_monster_action_completed)
	Events.player_hand_drawn.connect(_on_player_hand_drawn)


func setup_monsters(battle_stats: BattleStats) -> void:
	if not battle_stats:
		return
	
	for monster: Monster in get_children():
		monster.queue_free()
	
	var all_new_monsters = battle_stats.monsters.instantiate()
	
	for new_monster: Node2D in all_new_monsters.get_children():
		var new_monster_child = new_monster.duplicate() as Monster
		add_child(new_monster_child)
		new_monster_child.power_handler.powers_applied.connect(_on_monster_powers_applied.bind(new_monster_child))
		
	all_new_monsters.queue_free()


func reset_monster_actions() -> void:
	for monster: Monster in get_children():
		monster.current_action = null
		monster.update_action()


func start_turn() -> void:
	if get_child_count() == 0:
		return
	
	acting_monsters.clear()
	for monster: Monster in get_children():
		acting_monsters.append(monster)

	_start_next_monster_turn()


func _start_next_monster_turn() -> void:
	if acting_monsters.is_empty():
		Events.monster_turn_ended.emit()
		return
	
	acting_monsters[0].power_handler.apply_powers_by_type(Power.Type.START_OF_TURN)


# 写出来自己都绷不住的逆天生命周期
func _on_monster_powers_applied(type: Power.Type, monster: Monster) -> void:
	match type:
		Power.Type.START_OF_TURN:
			monster.do_turn()
		Power.Type.END_OF_TURN:
			acting_monsters.erase(monster)
			_start_next_monster_turn()


func _on_monster_died(monster: Monster) -> void:
	var is_monster_turn = acting_monsters.size() > 0
	acting_monsters.erase(monster)
	
	if is_monster_turn:
		_start_next_monster_turn()


func _on_monster_action_completed(monster: Monster) -> void:
	monster.power_handler.apply_powers_by_type(Power.Type.END_OF_TURN)


func _on_player_hand_drawn() -> void:
	for monster: Monster in get_children():
		monster.update_intent()
