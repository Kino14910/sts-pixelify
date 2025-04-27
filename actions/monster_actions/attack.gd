extends MonsterAction

@export var min_dmg: int
@export var max_dmg: int
@export var time: int = 1
var damage

func _ready() -> void:
	damage = randi_range(min_dmg, max_dmg)

func perform_action() -> void:
	if not monster or not target:
		return
	
	var tween = create_tween().set_trans(Tween.TRANS_QUINT)
	var start = monster.global_position
	var end = monster.global_position + Vector2.LEFT * 8
	
	var target_array: Array[Node] = [target]
	#damage_action.sound = sound
	
	tween.tween_property(monster, "global_position", end, 0.1)
	for i in time:
		tween.tween_callback(DamageAction.new().execute.bind(target_array, damage))
		tween.tween_interval(0.1)
	tween.tween_property(monster, "global_position", start, 0.1)
	
	tween.finished.connect(
		func():
			Events.monster_action_completed.emit(monster)
	)


func update_intent_text() -> void:
	var player = target as Player
	if not player:
		return
	
	var modified_dmg = player.modifier_handler.get_modified_value(damage, Modifier.Type.DMG_TAKEN)
	if time == 1:
		intent.current_text = intent.base_text % modified_dmg
	else:
		intent.current_text = intent.base_text % [modified_dmg] + 'x' + str(time)
