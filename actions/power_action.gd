# meta-name: Power
# meta-description: Create a Power which can be applied to a target.
class_name PowerAction
extends Action

var power: Power


func execute(targets: Array[Node], amount: int) -> void:
	for target in targets:
		if not target:
			continue
		if target is Monster or target is Player:
			target.power_handler.add_power(power)
