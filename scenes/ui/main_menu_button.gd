class_name MainMenuBtn
extends PanelContainer

signal pressed

@export var btn_text: String

@onready var border_radius: MainMenuBtn = self
@onready var gradient: PanelContainer = $Gradient
@onready var button: Button = $Gradient/Button
const GRADIENT = preload('res://scenes/ui/gradient.tres')

func _ready() -> void:
	button.text = btn_text

func _on_button_pressed() -> void:
	pressed.emit()


func _on_button_mouse_entered() -> void:
	gradient.add_theme_stylebox_override('panel', GRADIENT)
	
	
func _on_button_mouse_exited() -> void:
	gradient.add_theme_stylebox_override('panel', StyleBoxEmpty.new())
