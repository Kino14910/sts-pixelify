extends Card

@export var poison: Power

func apply_actions(targets: Array[Node]) -> void:
	for i in range(magicNumber):
		var random_target = [targets[randi() % targets.size()]]
		PowerAction.new(random_target, poison, 3)
