extends Card

const STRENGTH = preload('res://scripts/powers/strength.tres')

func apply_actions(targets: Array[Node]) -> void:
	PowerAction.new(targets, STRENGTH.new(), magicNumber)
func get_default_description() -> String:
	return description % magicNumber
	
