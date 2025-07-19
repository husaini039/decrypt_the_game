extends CanvasLayer


func _on_retry_pressed() -> void:
	Global.isPause = false
	$Pause.visible = false
	get_tree().paused = false
	Global.reset_globals()
	get_tree().change_scene_to_file("res://scene/Opening_scene.tscn")


func _on_resume_pressed() -> void:
	Global.isPause = false
	get_tree().paused = false
	$Pause.visible = false


func _on_mainmenu_pressed() -> void:
	Global.isPause = false
	$Pause.visible = false
	get_tree().paused = false
	Global.reset_globals()
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")
