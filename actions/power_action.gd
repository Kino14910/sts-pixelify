# meta-name: Power
# meta-description: Create a Power which can be applied to a target.
class_name PowerAction
extends Action

var power: Power

func _init(targets:Array[Node], _power: Power, amount: int = 1) -> void:
	self.power = _power
	execute(targets, amount)

func execute(targets: Array[Node], amount: int) -> void:
	for target in targets:
		if not target:
			continue
		if target is Monster or target is Player:
			if power.stack_type == power.StackType.DURATION:
				power.duration = amount
			elif power.stack_type == power.StackType.INTENSITY:
				power.stacks = amount
			else:
				continue
			
			target.power_handler.add_power(power)
