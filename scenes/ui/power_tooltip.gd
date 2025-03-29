class_name PowerTooltip
extends HBoxContainer

@export var power: Power: 
	set(value):
		if not is_node_ready():
			await ready
		
		power = value
		icon.texture = power.icon
		rich_text_label.text = power.get_tooltip()


@onready var icon: TextureRect = $Icon
#@onready var label: Label = $Label
@onready var rich_text_label: RichTextLabel = $RichTextLabel


#func _init(power: Power) -> void:
	#self.power = power
