extends Control

const RUN_SCENE = preload("res://scenes/run/run.tscn")

@export var IRONCLAD: CharacterStats
@export var SILENT: CharacterStats
@export var DETECT: CharacterStats
@export var WATCHER: CharacterStats

@export var IRONCLAD_PORTRAIT: CompressedTexture2D
@export var SLIENT_PORTRAIT: CompressedTexture2D
@export var DETECT_PORTRAIT: CompressedTexture2D
@export var WATCHER_PORTRAIT: CompressedTexture2D

@export var IRONCLAD_BG: CompressedTexture2D
@export var SILENT_BG: CompressedTexture2D
@export var DEFECT_BG: CompressedTexture2D
@export var WATCHER_BG: CompressedTexture2D

const MAIN_MENU_PATH = "res://scenes/ui/main_menu.tscn"

@export var run_startup: RunStartup

@onready var background: TextureRect = $Background
@onready var title: TextureRect = %Name
@onready var description: Label = %Description
@onready var character_portrait: TextureRect = %CharacterPortrait
@onready var start_button: Button = $StartButton

var current_character: CharacterStats: 
	set(value):	
		current_character = value
		title.texture = current_character.character_name_picture
		description.text = current_character.description
		character_portrait.texture = current_character.portrait
		start_button.disabled = false


func _ready() -> void:
	title.texture = null
	description.text = ''
	character_portrait.texture = null


func _shortcut_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().change_scene_to_file(MAIN_MENU_PATH)


func _on_start_button_pressed() -> void:
	run_startup.type = RunStartup.Type.NEW_RUN
	run_startup.picked_character = current_character
	var run: Run = RUN_SCENE.instantiate()
	run.run_startup = run_startup.duplicate(true)
	
	get_tree().root.add_child(run)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = run
	
	


func _on_iron_clad_pressed() -> void:
	current_character = IRONCLAD
	background.texture = IRONCLAD_BG


func _on_the_silent_pressed() -> void:
	current_character = SILENT
	background.texture = SILENT_BG

func _on_detect_pressed() -> void:
	current_character = DETECT
	background.texture = DEFECT_BG

func _on_watcher_pressed() -> void:
	current_character = WATCHER
	background.texture = WATCHER_BG
