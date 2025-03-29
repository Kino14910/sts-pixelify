# meta-name: Card Logic
# meta-description: What happens when a card is played.
extends Card

@export var optional_sound: AudioStream

func apply_actions(targets: Array[Node], _modifiers: ModifierHandler) -> void:
	print("My awesome card has been played!")
	print("Targets: %s" % targets)

func get_default_description() -> String:
	return description
