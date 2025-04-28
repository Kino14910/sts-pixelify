extends MonsterAction


const STRENGTH = preload('res://scripts/powers/strength.tres')
@export var stacks_per_action = 2

var hp_threshold = 25
var usages = 0


func is_performable() -> bool:
	var hp_under_threshold = monster.stats.health <= hp_threshold
	
	if usages == 0 or (usages == 1 and hp_under_threshold):
		return true
	
	return false


func perform_action() -> void:
	if not monster or not player:
		return
	
	usages += 1
	PowerAction.new([monster], STRENGTH.new(), stacks_per_action)
	
	SFXPlayer.play(sound)

	Events.monster_action_completed.emit(monster)
