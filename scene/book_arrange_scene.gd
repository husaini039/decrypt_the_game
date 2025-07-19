extends Node2D

var ppl_book = preload("res://asset/book/purple_book.JPG")


func _ready():
	Input.set_custom_mouse_cursor(null)  # Clear custom cursor
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)  # Set to arrow

func correct_book():
		if $ui/GridContainer4/PanelContainer4/TextureRect.texture.resource == ppl_book.resource_path:
				get_tree().change_scene_to_file("res://scene/livingRoom.tscn")
		


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/livingRoom.tscn")

func m_entered() -> void:
	Global.set_hand_cursor()
func m_exited() -> void:
	Global.reset_cursor()
