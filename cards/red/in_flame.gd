extends Card

const STRENGTH = preload('res://powers/strength.tres')

func apply_actions(targets: Array[Node], _modifiers: ModifierHandler) -> void:
	PowerAction.new(targets, STRENGTH.new(), magicNumber)

func get_default_description() -> String:
	return description % magicNumber
	
