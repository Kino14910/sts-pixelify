extends Card

const DEMON_FORM = preload('res://scripts/powers/demon_form.tres')

func apply_actions(targets: Array[Node]) -> void:
	PowerAction.new(targets, DEMON_FORM.new(), magicNumber)

func get_default_description() -> String:
	return description % magicNumber
	
