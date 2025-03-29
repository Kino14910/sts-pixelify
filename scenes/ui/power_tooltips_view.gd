extends VFlowContainer


const POWER_TOOLTIP = preload('res://scenes/ui/power_tooltip.tscn')

func _ready() -> void:
	Events.power_tooltips_requested.connect(show_tooltips)


func show_tooltips(powers: Array[Power], creature: Node2D) -> void:
	if visible:
		visible = false
		for tooltip: PowerTooltip in get_children():
			tooltip.queue_free()
		return
		
	for power in powers:
		var powerTooltip: PowerTooltip = POWER_TOOLTIP.instantiate()
		powerTooltip.power = power
		add_child(powerTooltip)
	if creature is Player:
		position.x = creature.selected_indicator.global_position.x + creature.selected_indicator.size.x
	if creature is Monster:
		position.x = creature.selected_indicator.global_position.x - size.x
		
	visible = true
