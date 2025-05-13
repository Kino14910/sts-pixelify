# meta-name: Relic
# meta-description: Create a Relic which can be acquired by the player.
extends Relic

var member_var = 0

# this happens once when we gain a new relic
func initialize_relic(_owner: RelicUI) -> void:
	pass


# this happens at specific times based on the Relic.Type property
func activate_relic(_owner: RelicUI) -> void:
	pass

# this gets called when a RelicUI is exiting the SceneTree i.e. getting deleted
# Event-based Relics should disconnect from the EventBus here.
func deactivate_relic(_owner: RelicUI) -> void:
	pass


# we can provide unique descriptions per relic if we want to
func get_tooltip() -> String:
	return tooltip
