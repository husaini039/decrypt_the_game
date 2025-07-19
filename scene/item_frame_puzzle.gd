extends Node2D

func _ready():
	Global.reset_cursor()
	if Global.pieces1:
		$click_pieces/Pieces1.visible = true
	if Global.pieces2:
		$click_pieces/Pieces2.visible = true
	if Global.pieces3:
		$click_pieces/Pieces3.visible = true
	if Global.pieces4:
		$click_pieces/Pieces4.visible = true
	
	if Global.pieces1_clicked:
		$pieces_piece/frame1.visible = true
		$click_pieces/Pieces1.visible = false
	if Global.pieces2_clicked:
		$pieces_piece/frame2.visible = true
		$click_pieces/Pieces2.visible = false
	if Global.pieces3_clicked:
		$pieces_piece/frame3.visible = true
		$click_pieces/Pieces3.visible = false
	if Global.pieces4_clicked:
		$pieces_piece/frame4.visible = true
		$click_pieces/Pieces4.visible = false


func check_all_pieces_placed():
	if Global.pieces1_clicked and Global.pieces2_clicked and Global.pieces3_clicked and Global.pieces4_clicked:
		$frame_unlock.play()
		DialogueManager.show_dialogue_balloon(load("res://dialog/frame_puzzle_complete.dialogue"), "start")
		Global.frame_complete = true


func pieces1(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$Shimmer1.play()
		$click_pieces/Pieces1.visible = false
		$pieces_piece/frame1.visible = true
		Global.pieces1_clicked = true
		check_all_pieces_placed()

func pieces2(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$Shimmer2.play()
		$click_pieces/Pieces2.visible = false
		$pieces_piece/frame2.visible = true
		Global.pieces2_clicked = true
		check_all_pieces_placed()

func pieces3(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$Shimmer3.play()
		$click_pieces/Pieces3.visible = false
		$pieces_piece/frame3.visible = true
		Global.pieces3_clicked = true
		check_all_pieces_placed()

func pieces4(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$Shimmer4.play()
		$click_pieces/Pieces4.visible = false
		$pieces_piece/frame4.visible = true
		Global.pieces4_clicked = true
		check_all_pieces_placed()



func _on_area_2d_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_area_2d_mouse_exited() -> void:
	Global.reset_cursor()


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/livingRoom.tscn")
