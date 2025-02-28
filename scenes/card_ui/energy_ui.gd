class_name EnergyUI
extends TextureRect

@export var char_stats: CharacterStats: 
	set(value):
		char_stats = value
		
		if not char_stats.stats_changed.is_connected(_on_stats_changed):
			char_stats.stats_changed.connect(_on_stats_changed)

		if not is_node_ready():
			await ready

		_on_stats_changed()
		
@onready var energy_label: Label = $EnergyLabel

func _ready() -> void:
	await get_tree().create_timer(1).timeout
	char_stats.energy = 3

func _on_stats_changed() -> void:
	energy_label.text = "%s/%s" % [char_stats.energy, char_stats.max_energy]
