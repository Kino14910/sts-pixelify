class_name DamageAction
extends Action

const attack_sound = preload('res://art/SOTE_SFX_FastAtk_v2.ogg')

var receiver_modifier_type = Modifier.Type.DMG_TAKEN

enum DamageType {
   NORMAL,
   THORNS,
   HP_LOSS
}

func _init(targets: Array[Node] = [], amount: int = 0, damagetype:DamageType = DamageType.NORMAL, sound:AudioStream = attack_sound) -> void:
	execute(targets, amount, damagetype, sound)


func execute(targets: Array[Node], amount: int, damagetype:DamageType = DamageType.NORMAL, sound:AudioStream = attack_sound) -> void:
	for target in targets:
		if not target:
			continue
		if target is Monster or target is Player:
			if damagetype == DamageType.NORMAL:
				target.take_damage(amount, receiver_modifier_type)
			if damagetype == DamageType.THORNS:
				target.take_damage(amount, Modifier.Type.NO_MODIFIER)
			SFXPlayer.play(sound if sound else attack_sound)
