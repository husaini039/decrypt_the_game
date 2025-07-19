extends Node2D
var button_type = null

func _ready() -> void:
	Global.reset_globals()

func _on_start_button_pressed() -> void:
	Global.reset_globals()
	button_type = "start"
	$FadeTransition.show()
	$FadeTransition/fade_timer.start()
	$FadeTransition/AnimationPlayer.play("fade_in")
	


func _on_about_pressed() -> void:
	get_tree().change_scene_to_file("res://addons/silent_wolf/Scores/Leaderboard.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_fade_timer_timeout() -> void:
	if button_type == "start" :
		get_tree().change_scene_to_file("res://scene/Opening_scene.tscn")
