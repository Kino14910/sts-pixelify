# meta-name: MonsterAction
# meta-description: An action which can be performed by an monster during its turn.
extends MonsterAction

@export var damage = randi_range(5, 7)

func perform_action() -> void:
	if not monster or not target:
		return
	
	var tween = create_tween().set_trans(Tween.TRANS_QUINT)
	var start = monster.global_position
	var end = target.global_position + Vector2.RIGHT * 32
	
	SFXPlayer.play(sound)
	
	Events.monster_action_completed.emit(monster)


# override 来实现动态意图
# e.g. attack actions.
func update_intent_text() -> void:
	var player = target as Player
	if not player:
		return
	
	var modified_dmg = player.modifier_handler.get_modified_value(damage, Modifier.Type.DMG_TAKEN)
	intent.current_text = intent.base_text % modified_dmg
