class_name MapRoom
extends Area2D

signal clicked(room: Room)
signal selected(room: Room)

const ICONS = {
	Room.Type.NOT_ASSIGNED: [null, Vector2.ONE],
	Room.Type.MONSTER: [preload("res://assets/tile_0103.png"), Vector2.ONE],
	Room.Type.TREASURE: [preload("res://assets/tile_0089.png"), Vector2.ONE],
	Room.Type.CAMPFIRE: [preload("res://assets/UI/player_heart.png"), Vector2(0.6, 0.6)],
	Room.Type.SHOP: [preload("res://assets/UI/gold.png"), Vector2(0.6, 0.6)],
	Room.Type.BOSS: [preload("res://assets/tile_0105.png"), Vector2(1.25, 1.25)],
	Room.Type.EVENT: [preload("res://assets/UI/rarity.png"), Vector2(0.9, 0.9)],
}

@onready var sprite_2d: Sprite2D = $Visuals/Sprite2D
@onready var line_2d: Line2D = $Visuals/Line2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var available = false: 
	set(value):
		available = value
		
		if available:
			animation_player.play("highlight")
		elif not room.selected:
			animation_player.play("RESET")
			
			
var room: Room: 
	set(value):
		room = value
		position = room.position
		line_2d.rotation_degrees = randi_range(0, 360)
		sprite_2d.texture = ICONS[room.type][0]
		sprite_2d.scale = ICONS[room.type][1]


func show_selected() -> void:
	line_2d.modulate = Color.WHITE


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if not available or not event.is_action_pressed("left_mouse"):
		return

	room.selected = true
	clicked.emit(room)
	animation_player.play("select")


# Called by the AnimationPlayer when the 'select' animation finishes.
# 在 AnimationPlayer 中的 'select' 播放完毕后执行
func _on_map_room_selected() -> void:
	selected.emit(room)
