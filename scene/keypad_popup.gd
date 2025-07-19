extends Sprite2D

func _on_area_num_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("Label")
		if label.text.length() < 3:
			$clickSound.play()
			get_node("resultLabel").text = ""
			label.text += "1"


func _on_area_num_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("Label")
		if label.text.length() < 3:
			$clickSound.play()
			get_node("resultLabel").text = ""
			label.text += "2"


func _on_area_del_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$clickSound.play()
		get_node("Label").text = ""
		get_node("resultLabel").text = ""


func _on_area_num_3_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("Label")
		if label.text.length() < 3:
			$clickSound.play()
			get_node("resultLabel").text = ""
			label.text += "3"


func _on_area_num_4_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("Label")
		if label.text.length() < 3:
			$clickSound.play()
			get_node("resultLabel").text = ""
			label.text += "4"


func _on_area_num_5_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("Label")
		if label.text.length() < 3:
			$clickSound.play()
			get_node("resultLabel").text = ""
			label.text += "5"


func _on_area_num_6_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("Label")
		if label.text.length() < 3:
			$clickSound.play()
			get_node("resultLabel").text = ""
			label.text += "6"

func _on_area_num_7_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("Label")
		if label.text.length() < 3:
			$clickSound.play()
			get_node("resultLabel").text = ""
			label.text += "7"


func _on_area_num_8_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("Label")
		if label.text.length() < 3:
			$clickSound.play()
			get_node("resultLabel").text = ""
			label.text += "8"


func _on_area_num_9_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("Label")
		if label.text.length() < 3:
			$clickSound.play()
			get_node("resultLabel").text = ""
			label.text += "9"


func _on_area_num_0_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = get_node("Label")
		if label.text.length() < 3:
			$clickSound.play()
			get_node("resultLabel").text = ""
			label.text += "0"


func _on_area_enter_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var entered_code = get_node("Label").text
		$resultSound.play()
		if entered_code == "123":
			get_node("Label").text = ""
			$correctSound.play()
			get_node("resultLabel").text = "correct!"
			Global.show_new_cabinet_livingRoom = true
			get_tree().change_scene_to_file("res://scene/livingRoom.tscn")
		else:
			get_node("Label").text = ""
			get_node("resultLabel").text = "wrong!"


func mouse_entered() -> void:
	Global.set_hand_cursor()
func mouse_exited() -> void:
	Global.reset_cursor()


func _on_left_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/livingRoom.tscn")


func _on_right_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/livingRoom.tscn")
