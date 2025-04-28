extends MonsterAction

@export var block: int
@export var power: Power
@export var number: int


func perform_action() -> void:
	if not monster or not player:
		return
	
	GainBlockAction.new([monster], block)
	PowerAction.new([monster], power, number)
