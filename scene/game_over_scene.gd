extends Node2D

@onready var fade_anim = $ColorRect2/AnimationPlayer

func _ready() -> void:
	Global.reset_globals()
	fade_anim.play("fade_out")


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/room1_mainRoom.tscn")


func _on_mainmenu_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")
