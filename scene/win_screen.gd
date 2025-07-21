extends Node2D

func _ready() -> void:
	$win.play()
	Global.reset_globals()


func _on_leaderboard_pressed() -> void:
	get_tree().change_scene_to_file("res://addons/silent_wolf/Scores/Leaderboard.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")
