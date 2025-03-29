class_name FloorUI
extends HBoxContainer


@export var run_stats: RunStats: 
	set(value):
		run_stats = value
		
		if not run_stats.floor_changed.is_connected(_update_floor):
			run_stats.floor_changed.connect(_update_floor)
			_update_floor()

@onready var label: Label = $Label


func _ready() -> void:
	label.text = "0"

func _update_floor() -> void:
	label.text = str(run_stats.floor)
