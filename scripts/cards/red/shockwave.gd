extends Card

const WEAKENED = preload('res://scripts/powers/weakened.tres')
const VULNERABLE = preload('res://scripts/powers/vulnerable.tres')


func apply_actions(targets: Array[Node]) -> void:
	PowerAction.new(targets, WEAKENED.new(), magicNumber)
	PowerAction.new(targets, VULNERABLE.new(), magicNumber)
	

func get_default_description() -> String:
	return description % magicNumber

func get_updated_description(player_modifiers: ModifierHandler, monster_modifiers: ModifierHandler) -> String:
	return description % magicNumber
