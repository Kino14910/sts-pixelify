class_name DamageAction
extends Action

const attack_sound = preload('res://art/SOTE_SFX_FastAtk_v2.ogg')

enum DamageType {
   NORMAL,
   THORNS,
   HP_LOSS
}


func execute(targets: Array[Node], amount: int, damagetype:DamageType = DamageType.NORMAL, sound:AudioStream = attack_sound) -> void:
	for target in targets:
		if not target:
			continue
		if target is Monster or target is Player:
			target.take_damage(amount)
			
			SFXPlayer.play(sound if sound else attack_sound)
