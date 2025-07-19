extends Node2D

func _ready() -> void:
		if Global.show_new_cabinet_livingRoom:
			$Almari.visible = true
			$Keypad.visible = false

		if Global.coll:
			$Almari/Button1.visible = false
			$Almari/Button2.visible = true
			
		if Global.pieces1:
			$Pieces1.visible = false
			
		if Global.frame_complete:
			$Cabinet/Frame.visible = false
			$Cabinet/FrameComplete.visible = true
			$picture_frame/frame_empty.visible = false
			$picture_frame/frame_with_content.visible = true


func arrowLeft(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/room1_mainRoom.tscn")


func arrowRight(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/readingRoom.tscn")


func _on_area_2d_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_area_2d_mouse_exited() -> void:
	Global.reset_cursor()


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/keypad_scene.tscn")

func _on_exit_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$keypadPopup.visible  = false



func _on_area_num_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("keypadPopup/Label")
		if label.text.length() < 3:
			$keypadPopup/clickSound.play()
			get_node("keypadPopup/resultLabel").text = ""
			label.text += "1"


func _on_area_num_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("keypadPopup/Label")
		if label.text.length() < 3:
			$keypadPopup/clickSound.play()
			get_node("keypadPopup/resultLabel").text = ""
			label.text += "2"


func _on_area_del_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$keypadPopup/clickSound.play()
		get_node("keypadPopup/Label").text = ""
		get_node("keypadPopup/resultLabel").text = ""


func _on_area_num_3_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("keypadPopup/Label")
		if label.text.length() < 3:
			$keypadPopup/clickSound.play()
			get_node("keypadPopup/resultLabel").text = ""
			label.text += "3"


func _on_area_num_4_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("keypadPopup/Label")
		if label.text.length() < 3:
			$keypadPopup/clickSound.play()
			get_node("keypadPopup/resultLabel").text = ""
			label.text += "4"


func _on_area_num_5_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("keypadPopup/Label")
		if label.text.length() < 3:
			$keypadPopup/clickSound.play()
			get_node("keypadPopup/resultLabel").text = ""
			label.text += "5"


func _on_area_num_6_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("keypadPopup/Label")
		if label.text.length() < 3:
			$keypadPopup/clickSound.play()
			get_node("keypadPopup/resultLabel").text = ""
			label.text += "6"

func _on_area_num_7_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("keypadPopup/Label")
		if label.text.length() < 3:
			$keypadPopup/clickSound.play()
			get_node("keypadPopup/resultLabel").text = ""
			label.text += "7"


func _on_area_num_8_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("keypadPopup/Label")
		if label.text.length() < 3:
			$keypadPopup/clickSound.play()
			get_node("keypadPopup/resultLabel").text = ""
			label.text += "8"


func _on_area_num_9_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("keypadPopup/Label")
		if label.text.length() < 3:
			$keypadPopup/clickSound.play()
			get_node("keypadPopup/resultLabel").text = ""
			label.text += "9"


func _on_area_num_0_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("keypadPopup/Label")
		if label.text.length() < 3:
			$keypadPopup/clickSound.play()
			get_node("keypadPopup/resultLabel").text = ""
			label.text += "0"


func _on_area_enter_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var entered_code = get_node("keypadPopup/Label").text
		$keypadPopup/resultSound.play()
		if entered_code == "206":
			get_node("keypadPopup/Label").text = ""
			get_node("keypadPopup/resultLabel").text = "correct!"
		else:
			get_node("keypadPopup/Label").text = ""
			get_node("keypadPopup/resultLabel").text = "wrong!"

func openYellowPaper(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if not $YellowPaper.visible:
			$CrumpledPaper/paperSound.play()
			$YellowPaper.visible = true

		
func closeYellowPaper(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$YellowPaper.visible = false


func bookOpen(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/item_frame_puzzle.tscn")


func _on_area_2d_2_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_area_2d_2_mouse_exited() -> void:
	Global.reset_cursor()


func click_button_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if !Global.coll:  # Only triggers once
			Global.coll = true
			$Almari/metal_fell.play()
			DialogueManager.show_dialogue_balloon(load("res://when_button_pressed.dialogue"), "start")
		
		$Almari/Button1.visible = false
		$Almari/Button2.visible = true


func click_piece1(viewport: Node, event: InputEvent, shape_idx: int) -> void:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$pieces_pickup.play()
			$Pieces1.visible = false
			Global.pieces1 = true


func click_picture_frmae(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/zoom_frame.tscn")
