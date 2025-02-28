class_name StatsUI
extends Control


@onready var health: TextureProgressBar = $Health
@onready var health_label: Label = %HealthLabel
@onready var block: TextureRect = $Block
@onready var block_label: Label = %BlockLabel

func update(stats: Stats) -> void:
	health.value = stats.health
	health.max_value = stats.max_health
	var pre_pos = size.x 
	size.x = get_parent().get_node('CollisionShape2D').shape.size.x
	health.size.x = size.x
	position.x -= size.x - pre_pos
	
	health_label.text = str(stats.health) + "/" + str(stats.max_health)
	block.visible = stats.block > 0
	block_label.text = str(stats.block)
