extends VBoxContainer

@onready var button_container: CenterContainer = %ButtonContainer
@onready var price: HBoxContainer = %Price
@onready var price_label: Label = %PriceLabel
@onready var delete_button: DeleteButton = %DeleteButton

var time: int = 0
var gold_cost = 75

func update(run_stats: RunStats) -> void:
	if not button_container or not price:
		return

	price_label.text = str(gold_cost)
	
	if run_stats.gold >= gold_cost:
		price_label.remove_theme_color_override('font_color')
		delete_button.affordable = true
	else:
		price_label.add_theme_color_override('font_color', Color.RED)
		delete_button.affordable = false


func _on_delete_button_pressed() -> void:
	pass # Replace with function body.
