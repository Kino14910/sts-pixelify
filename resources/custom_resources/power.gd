class_name Power
extends Resource

signal power_applied(power: Power)
signal power_changed

enum Lifetime {START_OF_TURN, END_OF_TURN, EVENT_BASED}
enum Type {BUFF, DEBUFF}
enum StackType {NONE, INTENSITY, DURATION}

@export_group("Power Data")
@export var id: String
@export var type: Type
@export var lifetime: Lifetime
@export var stack_type: StackType
@export var can_expire: bool
@export var duration: int:
	set(value):
		duration = value
		power_changed.emit()
		
@export var stacks: int: 
	set(value):
		stacks = value
		power_changed.emit()

@export_group("Power Visuals")
@export var icon: Texture
@export_multiline var tooltip: String


func initialize_power(_target: Node) -> void:
	pass

func apply_power(_target: Node) -> void:
	power_applied.emit(self)

func get_tooltip() -> String:
	return tooltip

func new() -> Resource:
	return duplicate()
