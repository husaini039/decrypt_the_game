extends Node2D

func _ready() -> void:
	Global.reset_globals()


func _on_leaderboard_pressed() -> void:
	get_tree().change_scene_to_file("res://addons/silent_wolf/Scores/Leaderboard.tscn")
