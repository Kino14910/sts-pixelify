extends MonsterAction

@export var block: int


func perform_action() -> void:
	if not monster or not player:
		return
	
	GainBlockAction.new([monster], block)

func update_intent_text() -> void:
	intent.current_text = intent.base_text % block
