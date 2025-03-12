class_name Power
extends Resource

signal power_applied(power: Power)
signal power_changed

enum Type {START_OF_TURN, END_OF_TURN, EVENT_BASED}
enum StackType {NONE, INTENSITY, DURATION}

@export_group("Power Data")
@export var id: String
@export var type: Type
@export var stack_type: StackType
@export var can_expire: bool
@export var duration: int : set = set_duration
@export var stacks: int : set = set_stacks

@export_group("Power Visuals")
@export var icon: Texture
@export_multiline var tooltip: String


func initialize_power(_target: Node) -> void:
	pass


func apply_power(_target: Node) -> void:
	power_applied.emit(self)


func get_tooltip() -> String:
	return tooltip


func set_duration(new_duration: int) -> void:
	duration = new_duration
	power_changed.emit()


func set_stacks(new_stacks: int) -> void:
	stacks = new_stacks
	power_changed.emit()
