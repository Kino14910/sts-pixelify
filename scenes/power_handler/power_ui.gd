class_name PowerUI
extends Control

@export var power: Power : set = set_power

@onready var icon: TextureRect = $Icon
@onready var duration: Label = $Duration
@onready var stacks: Label = $Stacks


func set_power(new_power: Power) -> void:
	if not is_node_ready():
		await ready
	
	power = new_power
	icon.texture = power.icon
	duration.visible = power.stack_type == Power.StackType.DURATION
	stacks.visible = power.stack_type == Power.StackType.INTENSITY
	custom_minimum_size = icon.size
	
	if duration.visible:
		custom_minimum_size = duration.size + duration.position
	elif stacks.visible:
		custom_minimum_size = stacks.size + stacks.position
	
	if not power.power_changed.is_connected(_on_power_changed):
		power.power_changed.connect(_on_power_changed)
	
	_on_power_changed()


func _on_power_changed() -> void:
	if not power:
		return

	if power.can_expire and power.duration <= 0:
		queue_free()
		
	if power.stack_type == Power.StackType.INTENSITY and power.stacks == 0:
		queue_free()

	duration.text = str(power.duration)
	stacks.text = str(power.stacks)
