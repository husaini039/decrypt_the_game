extends Node2D

@onready var line_edit: LineEdit = $name_input

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(load("res://dialog/opening_dialog.dialogue"), "start")
	await DialogueManager.dialogue_ended  # assumes signal exists
	line_edit.visible = true
	line_edit.grab_focus()
	line_edit.text_submitted.connect(input_name)

func input_name(text: String) -> void:
	if text != "":
		Global.player_name = text
		get_tree().change_scene_to_file("res://scene/room1_mainRoom.tscn")
