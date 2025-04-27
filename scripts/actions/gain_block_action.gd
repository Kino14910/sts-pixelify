class_name GainBlockAction
extends Action

const GainBlockSound = preload('res://assets/SOTE_SFX_GainDefense_RR1_v3.ogg')

func execute(targets: Array[Node], amount: int) -> void:
	for target in targets:
		if not target:
			continue
		if target is Monster or target is Player:
			target.stats.block += amount
			SFXPlayer.play(GainBlockSound)
