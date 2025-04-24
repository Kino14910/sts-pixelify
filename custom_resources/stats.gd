class_name Stats
extends Resource

signal stats_changed


@export var art: Texture

@export var max_health :int = 1: 
	set(value):
		var diff = value - max_health
		max_health = value
		
		if diff > 0:
			health += diff
		elif health > max_health:
			health = max_health
		
		stats_changed.emit()
		
var health: int: 
	set(value):
		health = clampi(value, 0, max_health)
		stats_changed.emit()

var block: int: 
	set(value):
		block = clampi(value, 0, 999)
		stats_changed.emit()

func take_damage(damage : int, damagetype: DamageAction.DamageType) -> void:
	if damage <= 0:
		return

	if damagetype == DamageAction.DamageType.HP_LOSS:
		health -= damage
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
