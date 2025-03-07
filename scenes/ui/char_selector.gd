extends Control

const RUN_SCENE = preload("res://scenes/run/run.tscn")
const IRONCLAD = preload('res://characters/Ironclad/Ironclad.tres')
const SILENCE_HUNTER = preload('res://characters/TheSilent/TheSilent.tres')
const WIZARD = preload('res://characters/Wizard/Wizard.tres')
@export var run_startup: RunStartup

@onready var title: Label = %Name
@onready var description: Label = %Description
@onready var character_portrait: TextureRect = %CharacterPortrait

var current_character: CharacterStats : set = set_current_character


func _ready() -> void:
	title.text = ''
	description.text = ''
	character_portrait.texture = null
	#set_current_character(IRONCLAD)


func set_current_character(new_character: CharacterStats) -> void:
	current_character = new_character
	title.text = current_character.character_name
	description.text = current_character.description
	character_portrait.texture = current_character.portrait


func _on_start_button_pressed() -> void:
	print("Start new Run with %s" % current_character.character_name)
	run_startup.type = RunStartup.Type.NEW_RUN
	run_startup.picked_character = current_character
	get_tree().change_scene_to_packed(RUN_SCENE)




func _on_iron_clad_pressed() -> void:
	current_character = IRONCLAD


func _on_silence_hunter_pressed() -> void:
	current_character = SILENCE_HUNTER


func _on_wizard_pressed() -> void:
	current_character = WIZARD
