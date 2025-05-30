extends MonsterAction

@export var min_dmg: int
@export var max_dmg: int
@export var time: int = 1
@export var power: Power
@export var number: int
var damage

func _ready() -> void:
	damage = randi_range(min_dmg, max_dmg)

func perform_action() -> void:
	if not monster or not player:
		return
	
	DamageAction.new([player], damage)
	PowerAction.new([player], power, number)


func update_intent_text() -> void:
	var player = player as Player
	if not player:
		return
	
	var modified_dmg = player.modifier_handler.get_modified_value(damage, Modifier.Type.DMG_TAKEN)
	
	if time == 1:
		intent.current_text = intent.base_text % modified_dmg
	else:
		intent.current_text = intent.base_text % [modified_dmg] + 'x' + str(time)
