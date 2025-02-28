class_name Stats
extends Resource

signal stats_changed

var max_health :int = 1 : set = set_max_health
@export var art: Texture

func _ready() -> void:
	print('ready')

var health: int: 
	set(value):
		health = clampi(value, 0, max_health)
		stats_changed.emit()

var block: int: 
	set(value):
		block = clampi(value, 0, 999)
		stats_changed.emit()

func set_max_health(value : int) -> void:
	var diff := value - max_health
	max_health = value
	
	if diff > 0:
		health += diff
	elif health > max_health:
		health = max_health
	
	stats_changed.emit()


func take_damage(damage : int) -> void:
	if damage <= 0:
		return

	damage -= block
	if (damage < 0):
		block = -damage
	else:
		block = 0
		health -= damage

func heal(amount : int) -> void:
	health += amount


func instantiate() -> Resource:
	var instance: Stats = self.duplicate()
	instance.health = max_health
	instance.block = 0
	return instance
