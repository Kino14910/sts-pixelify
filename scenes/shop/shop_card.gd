class_name ShopCard
extends VBoxContainer

const CARD_MENU_UI = preload("res://scenes/ui/card_menu_ui.tscn")

@export var card: Card: 
	set(value):
	
		if not is_node_ready():
			await ready

		card = value
		
		for card_menu_ui: CardMenuUI in card_container.get_children():
			card_menu_ui.queue_free()
		
		var new_card_menu_ui = CARD_MENU_UI.instantiate() as CardMenuUI
		new_card_menu_ui.gui_input.connect(_on_card_gui_input)
		card_container.add_child(new_card_menu_ui)
		new_card_menu_ui.card = card
		current_card_ui = new_card_menu_ui

@onready var card_container: CenterContainer = %CardContainer
@onready var price: HBoxContainer = %Price
@onready var price_label: Label = %PriceLabel
@onready var gold_cost = RNG.instance.randi_range(100, 300)

var current_card_ui: CardMenuUI

func update(run_stats: RunStats) -> void:
	if not card_container or not price:
		return

	price_label.text = str(gold_cost)
	
	if run_stats.gold >= gold_cost:
		price_label.remove_theme_color_override("font_color")
		current_card_ui.affordable = true
	else:
		price_label.add_theme_color_override("font_color", Color.RED)
		current_card_ui.affordable = false


func _on_card_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed('left_mouse') and current_card_ui.affordable:
		Events.shop_card_bought.emit(card, gold_cost)
		#if current_card_ui.is_connected('gui_input', _on_card_gui_input):
			#current_card_ui.disconnect('gui_input', _on_card_gui_input)
		card_container.queue_free()
		price.queue_free()
