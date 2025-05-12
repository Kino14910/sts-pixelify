class_name GainBlockAction
extends Action

const GainBlockSound = preload('res://assets/sounds/SOTE_SFX_GainDefense_RR1_v3.ogg')

func _init(targets: Array[Node], amount:int,) -> void:
	execute(targets, GameManager.player.modifier_handler.get_modified_value(amount, Modifier.Type.BLOCK_GAIN))
	

func execute(targets: Array[Node], amount: int) -> void:
	for target in targets:
		if not target:
			continue
		if target is Monster or target is Player:
			target.stats.block += amount
			SFXPlayer.play(GainBlockSound)
