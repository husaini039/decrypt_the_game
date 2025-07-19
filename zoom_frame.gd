extends Node2D

func _ready() -> void:
	if !Global.frame_complete:
		DialogueManager.show_dialogue_balloon(load("res://dialog/no_content_frame.dialogue"), "start")
	else:
		$FrameNotEmpty.visible = true

func exit_panel(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/livingRoom.tscn")

func _on_area_2d_mouse_entered() -> void:
	Global.set_hand_cursor()

func _on_area_2d_mouse_exited() -> void:
	Global.reset_cursor()
