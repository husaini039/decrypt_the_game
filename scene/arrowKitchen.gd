extends Node2D

func _ready() -> void:
	if Global.coll:
		$PanelNoCover/Area2D.visible = true
		$PanelNoCover/PanelCover.visible = false
		$PanelCover_drop.visible = true
		$glass_crack_pattern.visible = true

		if not Global.cracked_window:
			DialogueManager.show_dialogue_balloon(load("res://dialog/cracked_window_reaction.dialogue"), "start")
			Global.cracked_window = true
	
	if Global.pieces4:
		$Pieces4.visible = false
	
	if Global.isPanelPuzzle:
		$Screwdriver.visible = true
	
	if Global.isScrewdriver:
		$Screwdriver.visible = false




func arrowRight(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/room1_mainRoom.tscn")


func arrowLeft(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/readingRoom.tscn")


func _on_area_2d_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_area_2d_mouse_exited() -> void:
	Global.reset_cursor()


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/readingRoom.tscn")


func _on_area_2d_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/room1_mainRoom.tscn")


func go_panel_scene(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/panel_scene.tscn")


func click_piece4(viewport: Node, event: InputEvent, shape_idx: int) -> void:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$pieces_pickup.play()
			$Pieces4.visible = false
			Global.pieces4 = true


var can_click := true

func click_locked_panel(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if not can_click:
		return

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		can_click = false
		DialogueManager.show_dialogue_balloon(load("res://dialog/click_locked_panel.dialogue"), "start")


func click_screw(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		Global.isScrewdriver = true
		$Screwdriver.visible = false
