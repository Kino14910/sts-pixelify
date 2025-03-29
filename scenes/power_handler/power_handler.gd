class_name PowerHandler
extends GridContainer

signal powers_applied(type: Power.Type)

const POWER_APPLY_INTERVAL = 0.25
const POWER_UI = preload("res://scenes/power_handler/power_ui.tscn")

@export var power_owner: Node2D


func apply_powers_by_type(type: Power.Type) -> void:
	if type == Power.Type.EVENT_BASED:
		return
		
	var power_queue: Array[Power] = _get_all_powers().filter(
		func(power: Power):
			return power.type == type
	)
	if power_queue.is_empty():
		powers_applied.emit(type)
		return
	
	var tween = create_tween()
	for power: Power in power_queue:
		tween.tween_callback(power.apply_power.bind(power_owner))
		tween.tween_interval(POWER_APPLY_INTERVAL)
	
	tween.finished.connect(func(): powers_applied.emit(type))


func add_power(power: Power) -> void:
	var stackable = power.stack_type != Power.StackType.NONE
	
	# Add it if it's new
	if not _has_power(power.id):
		var new_power_ui = POWER_UI.instantiate() as PowerUI
		add_child(new_power_ui)
		new_power_ui.power = power
		new_power_ui.power.power_applied.connect(_on_power_applied)
		new_power_ui.power.initialize_power(power_owner)
		return

	# If it's unique and we already have it, we can return
	if not power.can_expire and not stackable:
		return
	
	# If it's duration-stackable, expand it
	if power.can_expire and power.stack_type == Power.StackType.DURATION:
		_get_power(power.id).duration += power.duration
		return
	
	# If it's stackable, stack it
	if power.stack_type == Power.StackType.INTENSITY:
		_get_power(power.id).stacks += power.stacks
	

func _has_power(id: String) -> bool:
	for power_ui: PowerUI in get_children():
		if power_ui.power.id == id:
			return true
			
	return false


func _get_power(id: String) -> Power:
	for power_ui: PowerUI in get_children():
		if power_ui.power.id == id:
			return power_ui.power
	
	return null


func _get_all_powers() -> Array[Power]:
	var powers: Array[Power] = []
	for power_ui: PowerUI in get_children():
		powers.append(power_ui.power)
		
	return powers


func _on_power_applied(power: Power) -> void:
	if power.can_expire:
		power.duration -= 1


func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		Events.power_tooltip_requested.emit(_get_all_powers())


func _on_mouse_entered() -> void:
	Events.power_tooltips_requested.emit(_get_all_powers(), power_owner)


func _on_mouse_exited() -> void:
	Events.power_tooltips_requested.emit(_get_all_powers(), power_owner)
