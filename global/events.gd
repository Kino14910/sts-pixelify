extends Node

# Cards-related events
signal card_drag_started(card_ui: CardUI)
signal card_drag_ended(card_ui: CardUI)
signal card_aim_started(card_ui: CardUI)
signal card_aim_ended(card_ui: CardUI)
signal card_aim_self_started()
signal card_aim_self_ended()
signal card_played()
signal hand_display()


# Card-related events
signal card_description_requested(card: Card)
signal description_hide_requested

# Player-related events
signal player_hand_drawn
signal player_hand_discarded
signal player_turn_ended
signal player_hit
signal player_died

# Monster-related events
signal monster_action_completed(monster: Monster)
signal monster_turn_ended
signal monster_died(monster: Monster)

# Battle-related events
signal battle_over_screen_requested(text: String, type: BattleOverPanel.Type)
signal battle_won
#signal status_description_requested(statuses: Array[Status])

## Map-related events
#signal map_exited(room: Room)

## Shop-related events
#signal shop_entered(shop: Shop)
#signal shop_relic_bought(relic: Relic, gold_cost: int)
#signal shop_card_bought(card: Card, gold_cost: int)
#signal shop_exited

# Campfire-related events
signal campfire_exited

# Battle Reward-related events
signal battle_reward_exited

## Treasure Room-related events
#signal treasure_room_exited(found_relic: Relic)
#
## Relic-related events
#signal relic_description_requested(relic: Relic)

# Random Event room-related events
signal event_room_exited
