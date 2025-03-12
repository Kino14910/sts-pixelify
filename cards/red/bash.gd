extends Card

@export var optional_sound: AudioStream
const VULNERABLE = preload('res://powers/vulnerable.tres')

#func get_default_description() -> String:
	#return description_text
#
#
#func get_updated_description(_player_modifiers: ModifierHandler, _monster_modifiers: ModifierHandler) -> String: # step 7.1
	#return description_text


func apply_actions(targets: Array[Node]) -> void:
	var damage_effect = DamageAction.new()
	damage_effect.execute(targets, damage, DamageAction.DamageType.NORMAL, optional_sound)
	
	var power_action = PowerAction.new()
	var vulnerable = VULNERABLE.duplicate()
	vulnerable.duration = magicNumber
	power_action.power = vulnerable
	power_action.execute(targets, magicNumber)
	
	
#func apply_actions(targets: Array[Node], _modifiers: ModifierHandler) -> void:
	#print("My awesome card has been played!")
	#print("Targets: %s" % targets)
