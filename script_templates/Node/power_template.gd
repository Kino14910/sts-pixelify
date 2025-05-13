# meta-name: Power
# meta-description: Create a Power which can be applied to a target.
class_name MyAwesomePower
extends Power

var member_var = 0


func initialize_power(target: Node) -> void:
	pass


func apply_power(target: Node) -> void:
	pass
	
	power_applied.emit(self)
