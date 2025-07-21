extends Node2D

@onready var fade_anim = $FadeTransition/AnimationPlayer

func _ready():
	if not Global.start_dialogue_shown:
		$FadeTransition.visible = true
		fade_anim.play("fade_out")
		fade_anim.animation_finished.connect(_on_fade_out_finished)
		await get_tree().create_timer(2).timeout
		DialogueManager.show_dialogue_balloon(load("res://dialog/start.dialogue"), "start")
		await DialogueManager.dialogue_ended
		Global.start_countdown()
		Global.start_dialogue_shown = true
	else:
		$FadeTransition.visible = false
		
	if Global.pieces3:
		$Pieces3.visible = false
	if Global.isBoard:
		$Board.visible = false
		$keypad_door.visible = true
	
	#win scene
	if Global.locked_door_panel:
		$Board.visible = false
		$Door.visible = false
		$door_open_control.visible =true

func _on_fade_out_finished(anim_name: String) -> void:
	if anim_name == "fade_out":
		$FadeTransition.visible = false

func clickSticky(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$pickup.play()
		$Sticky.visible = false
		$StickyPopup.visible = true
		$Door/doorArea.visible = false
		$Board/Area2D.visible = false


func close_popup(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$pickup2.play()
		$Sticky.visible = true
		$Door/doorArea.visible = true
		$Board/Area2D.visible = true
		$StickyPopup.visible = false
		
		
func _on_door_area_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_door_area_mouse_exited() -> void:
	Global.reset_cursor()

func _on_arrow_left_area_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_arrow_left_area_mouse_exited() -> void:
	Global.reset_cursor()

func _on_arrow_right_area_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_arrow_right_area_mouse_exited() -> void:
	Global.reset_cursor()

func _on_sticky_note_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_sticky_note_mouse_exited() -> void:
	Global.reset_cursor()
	
func _on_sticky_popup_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_sticky_popup_mouse_exited() -> void:
	Global.reset_cursor()


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/kitchen.tscn")


func _on_area_2d_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_area_2d_mouse_exited() -> void:
	Global.reset_cursor()

func _on_area_2d_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/livingRoom.tscn")

func _on_area_2d_2_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_area_2d_2_mouse_exited() -> void:
	Global.reset_cursor()

func click_piece3(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$pieces_pickup.play()
		$Pieces3.visible = false
		Global.pieces3 = true

func open_wood(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if not Global.isHammer:
			DialogueManager.show_dialogue_balloon(load("res://dialog/need_hammer.dialogue"), "start")
		else:
			Global.isBoard = true
			$Board.visible = false
			$keypad_door.visible = true
			$break_wood.play()
			DialogueManager.show_dialogue_balloon(load("res://dialog/board_break_reaction.dialogue"), "start")


func open_panel_door(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/keypad_maindoor_scene.tscn")

var score_submit = false

func exit_door(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if !score_submit:
			$FadeTransition.visible = true
			$win.play()
			var time_array = Global.get_time_as_minutes_seconds()
			var score = time_array[0] * 100 + time_array[1]  # Convert to MMSS format (e.g., 29:56 becomes 2956)
			SilentWolf.Scores.save_score(Global.player_name, score)
			score_submit = true
			fade_anim.play("fade_in")
			await get_tree().create_timer(4).timeout
			get_tree().change_scene_to_file("res://scene/win_screen.tscn")
