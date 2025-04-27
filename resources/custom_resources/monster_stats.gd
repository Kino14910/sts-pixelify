class_name MonsterStats
extends Stats

@export var ai: PackedScene
@export var min_hp: int
@export var max_hp: int


func instantiate() -> Resource:
	var instance: Stats = self.duplicate()
	instance.max_health = RNG.instance.randi_range(min_hp, max_hp)
	instance.health = instance.max_health
	instance.block = 0
	return instance
