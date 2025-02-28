class_name MonsterHandler
extends Node2D

var acting_monsters: Array[Monster] = []


func _ready() -> void:
	#Events.monster_died.connect(_on_monster_died)
	Events.monster_action_completed.connect(_on_monster_action_completed)
	Events.player_hand_drawn.connect(_on_player_hand_drawn)

#
#func setup_monsters(battle_stats: BattleStats) -> void:
	#if not battle_stats:
		#return
	#
	#for monster: Monster in get_children():
		#monster.queue_free()
	#
	#var all_new_monsters := battle_stats.monsters.instantiate()
	#
	#for new_monster: Node2D in all_new_monsters.get_children():
		#var new_monster_child := new_monster.duplicate() as Monster
		#add_child(new_monster_child)
		#new_monster_child.status_handler.statuses_applied.connect(_on_monster_statuses_applied.bind(new_monster_child))
		#
	#all_new_monsters.queue_free()


func reset_monster_actions() -> void:
	for monster: Monster in get_children():
		monster.current_action = null
		monster.update_action()


func start_turn() -> void:
	if get_child_count() == 0:
		return
	
	get_child(0).do_turn()
	
	#acting_monsters.clear()
	#for monster: Monster in get_children():
		#acting_monsters.append(monster)
#
	#_start_next_monster_turn()


#func _start_next_monster_turn() -> void:
	#if acting_monsters.is_empty():
		#Events.monster_turn_ended.emit()
		#return
	
	#acting_monsters[0].status_handler.apply_statuses_by_type(Status.Type.START_OF_TURN)


#func _on_monster_statuses_applied(type: Status.Type, monster: Monster) -> void:
	#match type:
		#Status.Type.START_OF_TURN:
			#monster.do_turn()
		#Status.Type.END_OF_TURN:
			#acting_monsters.erase(monster)
			#_start_next_monster_turn()


#func _on_monster_died(monster: Monster) -> void:
	#var is_monster_turn := acting_monsters.size() > 0
	#acting_monsters.erase(monster)
	#
	#if is_monster_turn:
		#_start_next_monster_turn()


func _on_monster_action_completed(monster: Monster) -> void:
	#monster.status_handler.apply_statuses_by_type(Status.Type.END_OF_TURN)
	if monster.get_index() == get_child_count() - 1:
		Events.monster_turn_ended.emit()
		return
	get_child(monster.get_index() + 1).do_turn()
	


func _on_player_hand_drawn() -> void:
	for monster: Monster in get_children():
		monster.update_intent()
