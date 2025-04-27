extends Control

const RUN_SCENE = preload("res://scenes/run/run.tscn")
const IRONCLAD = preload('res://scripts/characters/Ironclad/Ironclad.tres')
const SILENCE_HUNTER = preload('res://scripts/characters/TheSilent/TheSilent.tres')
const WIZARD = preload('res://scripts/characters/Wizard/Wizard.tres')
@export var run_startup: RunStartup

@onready var title: Label = %Name
@onready var description: Label = %Description
@onready var character_portrait: TextureRect = %CharacterPortrait
@onready var start_button: Button = $StartButton

var current_character: CharacterStats: 
	set(value):	
		current_character = value
		title.text = current_character.character_name
		description.text = current_character.description
		character_portrait.texture = current_character.portrait
		start_button.disabled = false


func _ready() -> void:
	title.text = ''
	description.text = ''
	character_portrait.texture = null


func _on_start_button_pressed() -> void:
	run_startup.type = RunStartup.Type.NEW_RUN
	run_startup.picked_character = current_character
	get_tree().change_scene_to_packed(RUN_SCENE)


func _on_iron_clad_pressed() -> void:
	current_character = IRONCLAD


func _on_silence_hunter_pressed() -> void:
	current_character = SILENCE_HUNTER


func _on_wizard_pressed() -> void:
	current_character = WIZARD
