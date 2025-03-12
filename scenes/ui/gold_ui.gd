class_name GoldUI
extends HBoxContainer

@export var run_stats: RunStats: 
	set(value):
		run_stats = value
		
		if not run_stats.gold_changed.is_connected(_update_gold):
			run_stats.gold_changed.connect(_update_gold)
			_update_gold()

@onready var label: Label = $Label


func _ready() -> void:
	label.text = "0"


func _update_gold() -> void:
	label.text = str(run_stats.gold)
