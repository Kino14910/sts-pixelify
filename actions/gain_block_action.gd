class_name GainBlockAction
extends Action

@export var amount: int
const GainBlockSound = preload('res://art/SOTE_SFX_GainDefense_RR1_v3.ogg')

func execute(targets: Array[Node]) -> void:
	for target in targets:
		if not target:
			continue
		if target is Monster or target is Player:
			target.stats.block += amount
			SFXPlayer.play(GainBlockSound)
