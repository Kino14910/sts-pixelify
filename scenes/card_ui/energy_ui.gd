class_name EnergyUI
extends TextureRect

@export var character_stats: CharacterStats: 
	set(value):
		character_stats = value
		
		if not character_stats.stats_changed.is_connected(_on_stats_changed):
			character_stats.stats_changed.connect(_on_stats_changed)

		if not is_node_ready():
			await ready

		_on_stats_changed()
		
@onready var energy_label: Label = $EnergyLabel

func _ready() -> void:
	await get_tree().create_timer(1).timeout
	character_stats.energy = 3

func _on_stats_changed() -> void:
	energy_label.text = "%s/%s" % [character_stats.energy, character_stats.max_energy]
