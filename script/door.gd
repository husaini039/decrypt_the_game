extends Area2D


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$doorLockedSound.play()
		DialogueManager.show_dialogue_balloon(load("res://dialog/main.dialogue"),"start")
		return
