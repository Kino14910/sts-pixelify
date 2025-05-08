extends Control

const RUN_SCENE = preload("res://scenes/run/run.tscn")
const IRONCLAD = preload('res://scripts/characters/Ironclad/Ironclad.tres')
const THE_SILENT = preload('res://scripts/characters/TheSilent/TheSilent.tres')
const DETECT = preload('res://scripts/characters/Detect/Detect.tres')
const WATCHER = preload('res://scripts/characters/Watcher/Watcher.tres')

const IRONCLAD_PORTRAIT = preload('res://assets/characters/Ironclad_portrait.png')
const THE_SLIENT_PORTRAIT = preload('res://assets/characters/The_slient_portrait.png')
const DETECT_PORTRAIT = preload('res://assets/characters/Detect_Portrait.png')
const WATCHER_PORTRAIT = preload('res://assets/characters/Watcher_portrait.png')

const MAIN_MENU_PATH = "res://scenes/ui/main_menu.tscn"

@export var run_startup: RunStartup
@onready var name_2

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
	get_tree().change_scene_to_packed(RUN_SCENE)


func _on_iron_clad_pressed() -> void:
	current_character = IRONCLAD


func _on_the_silent_pressed() -> void:
	current_character = THE_SILENT


func _on_detect_pressed() -> void:
	current_character = DETECT


func _on_watcher_pressed() -> void:
	current_character = WATCHER
