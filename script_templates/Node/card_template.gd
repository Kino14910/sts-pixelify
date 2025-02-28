# meta-name: Card Logic
# meta-description: What happens when a card is played.
extends Card

@export var optional_sound: AudioStream


#func get_default_description() -> String:
	#return description_text
#
#
#func get_updated_description(_player_modifiers: ModifierHandler, _monster_modifiers: ModifierHandler) -> String: # step 7.1
	#return description_text


func apply_actions(targets: Array[Node]) -> void:
	print("My awesome card has been played!")
	print("Targets: %s" % targets)
#func apply_actions(targets: Array[Node], _modifiers: ModifierHandler) -> void:
	#print("My awesome card has been played!")
	#print("Targets: %s" % targets)
