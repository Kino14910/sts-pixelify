extends Card

@export var optional_sound: AudioStream

func apply_actions(targets: Array[Node]) -> void:
	DamageAction.new(targets, damage)
