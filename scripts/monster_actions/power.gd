extends MonsterAction

enum TargetType { MONSTER, PLAYER }
@export var target_type: TargetType
@export var powers: Array[Power]
@export var number: int

func perform_action() -> void:
	if not monster or not player:
		return
	for power in powers:
		PowerAction.new([_get_target()], power, number)


func _get_target() -> Node2D:
	match target_type:
		TargetType.MONSTER: 
			return monster
		TargetType.PLAYER: 
			return player
		_:
			push_error("Invalid target type")
			return null
