extends Card

const TRUE_STRENGTH_FORM = preload('res://powers/true_strength_form.tres')

func apply_actions(targets: Array[Node], _modifiers: ModifierHandler) -> void:
	PowerAction.new(targets, TRUE_STRENGTH_FORM.new(), magicNumber)

func get_default_description() -> String:
	return description % magicNumber
	
