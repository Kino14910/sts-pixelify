class_name ShopRelic
extends VBoxContainer

const RELIC_UI = preload("res://scenes/relic_handler/relic_ui.tscn")

@export var relic: Relic:
	set(value):
		if not is_node_ready():
			await ready

		relic = value
		
		for relic_ui: RelicUI in relic_container.get_children():
			relic_ui.queue_free()
		
		var new_relic_ui = RELIC_UI.instantiate() as RelicUI
		new_relic_ui.gui_input.connect(_on_relic_gui_input)
		relic_container.add_child(new_relic_ui)
		new_relic_ui.relic = relic
		current_relic_ui = new_relic_ui

@onready var relic_container: CenterContainer = %RelicContainer
@onready var price: HBoxContainer = %Price
@onready var price_label: Label = %PriceLabel
@onready var gold_cost = randi_range(100, 300)


var current_relic_ui: RelicUI

func update(run_stats: RunStats) -> void:
	if not relic_container or not price:
		return

	price_label.text = str(gold_cost)
	
	if run_stats.gold >= gold_cost:
		price_label.remove_theme_color_override("font_color")
		current_relic_ui.affordable = true
	else:
		price_label.add_theme_color_override("font_color", Color.RED)
		current_relic_ui.affordable = false


func _on_relic_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed('left_mouse') and current_relic_ui.affordable:
		Events.shop_relic_bought.emit(relic, gold_cost)
		relic_container.queue_free()
		price.queue_free()
