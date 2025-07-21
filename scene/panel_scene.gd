extends Node2D

var SWITCH_ON: Texture
var SWITCH_OFF: Texture
var control2: Control
var buttons: Dictionary = {}

func _ready():
	# Load textures at runtime instead of preload
	SWITCH_ON = load("res://asset/panel_stuff/btn_switch_on.png")
	SWITCH_OFF = load("res://asset/panel_stuff/btn_switch_off.png")
	
	if Global.isPanelPuzzle:
		disable_panel()
	
	# Wait a frame to ensure nodes are ready
	await get_tree().process_frame
	
	control2 = $Control2
	if not control2:
		push_error("Control2 node not found!")
		return
		
	# Cache button references and setup
	for i in range(17):
		var btn = control2.get_node("Button%d" % i)
		if btn:
			buttons[i] = btn
			if btn is TextureButton:
				btn.texture_pressed = null
				btn.texture_hover = null
				btn.texture_focused = null

func play_click_sound():
	$click.play()

func is_switch_on(btn: TextureButton) -> bool:
	return btn.texture_normal == SWITCH_ON or btn.texture_pressed == SWITCH_ON

func is_switch_off(btn: TextureButton) -> bool:
	return btn.texture_normal == SWITCH_OFF or btn.texture_pressed == SWITCH_OFF

func check_win() -> void:
	var expected_states = [
		true,  # Button0
		null,  # Button1 (ignored)
		true,  # Button2
		true,  # Button3
		false, # Button4

		true,  # Button5
		false, # Button6
		true,  # Button7
		true,  # Button8

		false, # Button9
		false, # Button10
		false, # Button11
		false, # Button12

		false, # Button13
		false, # Button14
		true,  # Button15
		true   # Button16
	]

	for i in expected_states.size():
		var expected = expected_states[i]
		if expected == null:
			continue  # Skip check for this button index

		var btn = $Control2.get_node("Button%d" % i)
		var actual = is_switch_on(btn)

		if actual != expected:
			return  # Not a win
			
	await get_tree().create_timer(.3).timeout
	Global.isPanelPuzzle = true
	if Global.isPanelPuzzle:
		$done.play()
		DialogueManager.show_dialogue_balloon(load("res://dialog/panel_puzzle_done.dialogue"), "start")
		disable_panel()
		
func disable_panel():
	$Control2/Button0.disabled = true
	$Control2/Button2.disabled = true
	$Control2/Button3.disabled = true
	$Control2/Button4.disabled = true
	$Control2/Button5.disabled = true
	$Control2/Button6.disabled = true
	$Control2/Button7.disabled = true
	$Control2/Button8.disabled = true
	$Control2/Button9.disabled = true
	$Control2/Button10.disabled = true
	$Control2/Button11.disabled = true
	$Control2/Button12.disabled = true
	$Control2/Button13.disabled = true
	$Control2/Button14.disabled = true
	$Control2/Button15.disabled = true
	$Control2/Button16.disabled = true

func set_button_texture(btn: TextureButton, state: bool) -> void:
	btn.texture_normal = SWITCH_ON if state else SWITCH_OFF

func xor_toggle(clicked_btn: TextureButton, affected_buttons: Array) -> void:
	if not SWITCH_ON or not SWITCH_OFF:
		push_error("Switch textures not loaded!")
		return
		
	var clicked_on = is_switch_on(clicked_btn)
	
	for btn in affected_buttons:
		if not is_instance_valid(btn) or btn == clicked_btn:
			continue
		var current_on = is_switch_on(btn)
		var new_state = current_on != clicked_on  # XOR logic
		set_button_texture(btn, new_state)


func _on_button_0_pressed() -> void:
	var clicked = $Control2/Button0
	var targets = [
		$Control2/Button0,
		$Control2/Button2,
		$Control2/Button5,
		$Control2/Button6,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_2_pressed() -> void:
	var clicked = $Control2/Button2
	var targets = [
		$Control2/Button0,
		$Control2/Button3,
		$Control2/Button5,
		$Control2/Button6,
		$Control2/Button7,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_3_pressed() -> void:
	var clicked = $Control2/Button3
	var targets = [
		$Control2/Button2,
		$Control2/Button4,
		$Control2/Button6,
		$Control2/Button7,
		$Control2/Button8,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_4_pressed() -> void:
	var clicked = $Control2/Button4
	var targets = [
		$Control2/Button3,
		$Control2/Button7,
		$Control2/Button8,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_5_pressed() -> void:
	var clicked = $Control2/Button5
	var targets = [
		$Control2/Button0,
		$Control2/Button2,
		$Control2/Button6,
		$Control2/Button9,
		$Control2/Button10,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_6_pressed() -> void:
	var clicked = $Control2/Button6
	var targets = [
		$Control2/Button0,
		$Control2/Button2,
		$Control2/Button3,
		$Control2/Button5,
		$Control2/Button7,
		$Control2/Button9,
		$Control2/Button10,
		$Control2/Button11,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_7_pressed() -> void:
	var clicked = $Control2/Button7
	var targets = [
		$Control2/Button2,
		$Control2/Button3,
		$Control2/Button4,
		$Control2/Button6,
		$Control2/Button8,
		$Control2/Button10,
		$Control2/Button11,
		$Control2/Button12,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_8_pressed() -> void:
	var clicked = $Control2/Button8
	var targets = [
		$Control2/Button3,
		$Control2/Button4,
		$Control2/Button7,
		$Control2/Button11,
		$Control2/Button12,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_9_pressed() -> void:
	var clicked = $Control2/Button9
	var targets = [
		$Control2/Button5,
		$Control2/Button6,
		$Control2/Button10,
		$Control2/Button13,
		$Control2/Button14,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_10_pressed() -> void:
	var clicked = $Control2/Button10
	var targets = [
		$Control2/Button5,
		$Control2/Button6,
		$Control2/Button7,
		$Control2/Button9,
		$Control2/Button11,
		$Control2/Button13,
		$Control2/Button14,
		$Control2/Button15,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_11_pressed() -> void:
	var clicked = $Control2/Button11
	var targets = [
		$Control2/Button6,
		$Control2/Button7,
		$Control2/Button8,
		$Control2/Button10,
		$Control2/Button12,
		$Control2/Button14,
		$Control2/Button15,
		$Control2/Button16,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_12_pressed() -> void:
	var clicked = $Control2/Button12
	var targets = [
		$Control2/Button7,
		$Control2/Button8,
		$Control2/Button11,
		$Control2/Button15,
		$Control2/Button16,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_13_pressed() -> void:
	var clicked = $Control2/Button13
	var targets = [
		$Control2/Button9,
		$Control2/Button10,
		$Control2/Button14,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_14_pressed() -> void:
	var clicked = $Control2/Button14
	var targets = [
		$Control2/Button9,
		$Control2/Button10,
		$Control2/Button11,
		$Control2/Button13,
		$Control2/Button15,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_15_pressed() -> void:
	var clicked = $Control2/Button15
	var targets = [
		$Control2/Button10,
		$Control2/Button11,
		$Control2/Button12,
		$Control2/Button14,
		$Control2/Button16,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()

func _on_button_16_pressed() -> void:
	var clicked = $Control2/Button16
	var targets = [
		$Control2/Button11,
		$Control2/Button12,
		$Control2/Button15,
	]
	play_click_sound()
	xor_toggle(clicked, targets)
	check_win()




func _on_left_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/kitchen.tscn")


func _on_left_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_left_mouse_exited() -> void:
	Global.reset_cursor()

func _on_reset_pressed() -> void:
	play_click_sound()  # optional
	$Control/Button0.text = "1"
	$Control/Button2.text = "1"
	$Control/Button3.text = "0" 
	$Control/Button4.text = "0" 
	$Control/Button5.text = "1" 
	$Control/Button6.text = "0" 
	$Control/Button7.text = "0" 
	$Control/Button8.text = "1" 
	$Control/Button9.text = "1" 
	$Control/Button10.text = "0" 
	$Control/Button11.text = "1" 
	$Control/Button12.text = "0" 
	$Control/Button13.text = "0" 
	$Control/Button14.text = "1" 
	$Control/Button15.text = "1" 
	$Control/Button16.text = "0"


func left(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/kitchen.tscn")

#click on red note
func click_clue1(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if !$notes/green_note.visible:
			$pickup.play()
			$notes/red_note.visible = true
			$notes/XorClue/Area2D.visible = false
			$Control2.visible = false

func close_red_note(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$notes/red_note.visible = false
		$pickup2.play()
		$notes/XorClue/Area2D.visible = true
		$Control2.visible = true


func click_green(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if !$notes/red_note.visible:
			$pickup.play()
			$notes/green_note.visible = true
			$notes/XorClue2/Area2D.visible = false
			$Control2.visible = false


func close_green_note(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$notes/green_note.visible = false
		$pickup2.play()
		$notes/XorClue2/Area2D.visible = true
		$Control2.visible = true


func _on_area_2d_mouse_entered() -> void:
	Global.set_hand_cursor()

func _on_area_2d_mouse_exited() -> void:
	Global.reset_cursor()
