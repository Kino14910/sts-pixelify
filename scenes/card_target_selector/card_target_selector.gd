extends Node2D

const ARC_POINTS = 32

@onready var area_2d: Area2D = $Area2D
@onready var card_arc: Line2D = $CanvasLayer/CardArc

var current_card: CardUI
var targeting = false

func _ready() -> void:
	Events.card_aim_started.connect(_on_card_aim_started)
	Events.card_aim_ended.connect(_on_card_aim_ended)

func _process(delta: float) -> void:
	if not targeting:
		return
	area_2d.position = get_local_mouse_position()
	card_arc.points = _get_points()
	
func _get_points() -> Array:
	var points = []
	var start = current_card.global_position
	start.x += (current_card.size.x / 2)
	var target = get_local_mouse_position()
	var distance = (target - start)
	
	# 将 y = f(x) 变为 y = f(x) * 1-(1-x)^3 
	for i in ARC_POINTS:
		# t 相当于 dx
		var t = (1.0 / ARC_POINTS) * i # i/8
		var x = start.x + distance.x * t
		var y = start.y + ease_out_cubic(t) * distance.y
		points.append(Vector2(x, y))
	
	points.append(target)
	
	return points
	
func ease_out_cubic(number: float) -> float:
	return 1.0 - pow(1.0 - number, 3) # 1-(1-t)^3

func _on_card_aim_started(card: CardUI) -> void:
	if not card.card.is_single_target():
		return
	current_card = card
	targeting = true
	area_2d.monitoring = true
	area_2d.monitorable = true

func _on_card_aim_ended(card: CardUI) -> void:
	current_card = null
	targeting = false
	area_2d.monitoring = false
	area_2d.monitorable = false
	card_arc.clear_points()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if not current_card or not targeting:
		return
	
	if not current_card.targets.has(area):
		current_card.targets.append(area)
		card_arc.default_color = Color.ORANGE_RED

func _on_area_2d_area_exited(area: Area2D) -> void:
	card_arc.default_color = Color.WHITE
	
	if not current_card or not targeting:
		return
	current_card.targets.erase(area)
	
	
