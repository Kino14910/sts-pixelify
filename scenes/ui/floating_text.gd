extends Node2D

@onready var label: Label = $Label

var position_tween: Tween
var scale_tween: Tween

func _ready() -> void:
	scale = Vector2.ZERO
	display_damage_text(99)

func display_damage_text(damage_amount: float) -> void:
	if position_tween != null and position_tween.is_running():
		position_tween.kill()
	if scale_tween != null and scale_tween.is_running():
		scale_tween.kill()
	label.text = str(damage_amount)
	position_tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	scale_tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	
	position_tween.tween_property(self, "global_position", global_position + Vector2.UP * 16, 0.3)
	scale_tween.tween_property(self, "scale", Vector2.ONE * 2, 0.15)
	scale_tween.tween_property(self, "scale", Vector2.ONE, 0.3)
	
	position_tween.chain().tween_property(self, "global_position", global_position + Vector2.UP * 48, 0.8)
	scale_tween.chain().tween_property(self, "scale", Vector2.ZERO, 0.4)
