extends Node2D

func _ready() -> void:
	if Global.isHammer:
		$FromTopCabinet/Hammer.visible = false
		$cabinet_close.visible = true
		$FromTopCabinet.visible = true

func click_cabinet(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if Global.isKey:
			$open.play()
			$cabinet_close.visible = true
			$FromTopCabinet.visible = true
		else:
			$try.play()
			DialogueManager.show_dialogue_balloon(load("res://dialog/locked_cabinet.dialogue"), "start")
		

func exit(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/readingRoom.tscn")


func _on_area_2d_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_area_2d_mouse_exited() -> void:
	Global.reset_cursor()


func click_hammer(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		Global.isHammer = true
		DialogueManager.show_dialogue_balloon(load("res://dialog/hammer_pickup_reaction.dialogue"), "start")
		$FromTopCabinet/Hammer.visible = false
