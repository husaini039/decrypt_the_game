extends Node2D

@onready var line_edit: LineEdit = $name_input

func _ready() -> void:
	MainSong.playing = false
	$bg.play()
	
	
	$AnimationPlayer.play("fade_in_text")
	$caution.visible = true
	await get_tree().create_timer(3.5).timeout
	$AnimationPlayer.play("fade_out_text")
	await get_tree().create_timer(2).timeout
	$caution.visible = false
	
	$AnimationPlayer.play("fade_in_pause")
	$caution2.visible = true
	await get_tree().create_timer(3).timeout
	$AnimationPlayer.play("fade_out_pause")
	await get_tree().create_timer(2).timeout
	$caution2.visible = false
	
	DialogueManager.show_dialogue_balloon(load("res://dialog/opening_dialog.dialogue"), "start")
	await DialogueManager.dialogue_ended  # assumes signal exists
	line_edit.visible = true
	$press_enter.visible = true
	line_edit.grab_focus()
	line_edit.text_submitted.connect(input_name)

func input_name(text: String) -> void:
	if text != "":
		Global.player_name = text
		get_tree().change_scene_to_file("res://scene/room1_mainRoom.tscn")
