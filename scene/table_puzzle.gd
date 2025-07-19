extends Node2D

var shake_strength := 3
var original_position := Vector2.ZERO
var original_position2 := Vector2.ZERO
var original_position3 := Vector2.ZERO
var original_position4 := Vector2.ZERO

var shake_duration := 0.5  # Duration of the shake effect in seconds
var shake_timer := 0.0  # Timer to track the shake duration

@onready var screw = $TablePanel/Skru1/Area2D/Screwdriver  
@onready var screw2 = $TablePanel/Skru2/Area2D2/Screwdriver2
@onready var screw3 = $TablePanel/Skru3/Area2D3/Screwdriver3
@onready var screw4 = $TablePanel/Skru4/Area2D4/Screwdriver4

func _ready() -> void:
	original_position = screw.position 
	original_position2 = screw2.position  
	original_position3 = screw3.position 
	original_position4 = screw4.position  
	
	randomize()  # For randomization of the shake effect
	
	if Global.won_table_puzzle:
		$button_unpressed/ButtonA2.visible = false
		$button_unpressed/ButtonD4.visible = false
		$button_unpressed/Button1f.visible = false
		$KeyBox/KeY.visible = true
		$KeyCover.visible = false
	if Global.isKey:
		$KeyBox/KeY.visible = false
	if Global.isPanel:
		$TablePanel.visible = false

func _process(delta):
	# If shake_timer is positive, shake the screw
	if shake_timer > 0:
		# Apply random offset to create the shake effect
		var offset = Vector2(
			randf_range(-shake_strength, shake_strength),
			randf_range(-shake_strength, shake_strength)
		)
		screw.position = original_position + offset
		
		var offset2 = Vector2(
			randf_range(-shake_strength, shake_strength),
			randf_range(-shake_strength, shake_strength)
		)
		screw2.position = original_position2 + offset2
		
		var offset3 = Vector2(
			randf_range(-shake_strength, shake_strength),
			randf_range(-shake_strength, shake_strength)
		)
		screw3.position = original_position3 + offset3
		var offset4 = Vector2(
			randf_range(-shake_strength, shake_strength),
			randf_range(-shake_strength, shake_strength)
		)
		screw4.position = original_position4 + offset4
	
		shake_timer -= delta
		# If shake timer ends, reset the screw position to the original one
		if shake_timer <= 0:
			screw.position = original_position
			screw2.position = original_position2
			screw3.position = original_position3
			screw4.position = original_position4

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file("res://scene/readingRoom.tscn")


func _on_area_2d_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_area_2d_mouse_exited() -> void:
	Global.reset_cursor()



func _on_a_2_mouse_entered() -> void:
	Global.set_hand_cursor()
func _on_a_2_mouse_exited() -> void:
	Global.reset_cursor()


func click_panel(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if not Global.isScrewdriver:
			DialogueManager.show_dialogue_balloon(load("res://dialog/table_puzzle_locked.dialogue"), "start")
		else:
			$TablePanel
		

var incorrect_click = 0
var count_click = 0

func check_win() -> void:
	print("Incorrect clicks: ", incorrect_click)
	print("Total clicks: ", count_click)

	# Check if the total clicks are equal to 3
	if count_click >= 3:
		await get_tree().create_timer(.3).timeout
		if not $button_unpressed/ButtonA2.visible and not $button_unpressed/Button1f.visible and not $button_unpressed/ButtonD4.visible:
			print("You win!")
			$KeyBox/KeY.visible = true
			$KeyCover.visible = false
			Global.won_table_puzzle = true
			$ting.play()
		else:
			# If not all 3 buttons are clicked, reset the buttons
			$wrong.play()
			incorrect_click = 0
			count_click = 0
			reset_buttons()
	

func reset_buttons() -> void:
	# Reset all buttons to visible
	$button_unpressed/ButtonA2.visible = true
	$button_unpressed/Button1f.visible = true
	$button_unpressed/ButtonD4.visible = true
	$button_unpressed/Button3c.visible = true
	$button_unpressed/ButtonC1.visible = true
	$button_unpressed/ButtonFf.visible = true
	$button_unpressed/Button6f.visible = true
	$button_unpressed/Button4c.visible = true
	$button_unpressed/Button9e.visible = true
	$button_unpressed/Button57.visible = true
	$button_unpressed/Button3b.visible = true
	$button_unpressed/Button22.visible = true

#C1
func a2(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if $button_unpressed/Button3c.visible and $button_unpressed/ButtonC1.visible and $button_unpressed/ButtonFf.visible:
			$click_button.play()
			$button_unpressed/ButtonA2.visible = false
			count_click += 1
			check_win()

func on3c(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if $button_unpressed/ButtonA2.visible and $button_unpressed/ButtonC1.visible and $button_unpressed/ButtonFf.visible:
			$click_button.play()
			$button_unpressed/Button3c.visible = false
			incorrect_click += 1
			count_click += 1
			check_win()

func bc1(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if $button_unpressed/ButtonA2.visible and $button_unpressed/Button3c.visible and $button_unpressed/ButtonFf.visible:
			$click_button.play()
			$button_unpressed/ButtonC1.visible = false
			incorrect_click += 1
			count_click += 1
			check_win()

func _on_ff_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if $button_unpressed/ButtonA2.visible and $button_unpressed/Button3c.visible and $button_unpressed/ButtonC1.visible:
			$click_button.play()
			$button_unpressed/ButtonFf.visible = false
			incorrect_click += 1
			count_click += 1
			check_win()


#column 2
func b6f(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if $button_unpressed/Button1f.visible and $button_unpressed/Button4c.visible and $button_unpressed/Button9e.visible:
			$click_button.play()
			$button_unpressed/Button6f.visible = false
			incorrect_click += 1
			count_click += 1
			check_win()

func _on_f_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if $button_unpressed/Button6f.visible and $button_unpressed/Button4c.visible and $button_unpressed/Button9e.visible:
			$click_button.play()
			$button_unpressed/Button1f.visible = false
			count_click += 1
			check_win()

func _on_c_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if $button_unpressed/Button6f.visible and $button_unpressed/Button1f.visible and $button_unpressed/Button9e.visible:
			$click_button.play()
			$button_unpressed/Button4c.visible = false
			incorrect_click += 1
			count_click += 1
			check_win()

func on9e(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if $button_unpressed/Button6f.visible and $button_unpressed/Button1f.visible and $button_unpressed/Button4c.visible:
			$click_button.play()
			$button_unpressed/Button9e.visible = false
			incorrect_click += 1
			count_click += 1
			check_win()



func b57(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if $button_unpressed/Button3b.visible and $button_unpressed/Button22.visible and $button_unpressed/ButtonD4.visible:
			$click_button.play()
			$button_unpressed/Button57.visible = false
			incorrect_click += 1
			count_click += 1
			check_win()

func _on_b_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if $button_unpressed/Button57.visible and $button_unpressed/Button22.visible and $button_unpressed/ButtonD4.visible:
			$click_button.play()
			$button_unpressed/Button3b.visible = false
			incorrect_click += 1
			count_click += 1
			check_win()

func b22(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if $button_unpressed/Button57.visible and $button_unpressed/Button3b.visible and $button_unpressed/ButtonD4.visible:
			$click_button.play()
			$button_unpressed/Button22.visible = false
			incorrect_click += 1
			count_click += 1
			check_win()

func _on_d_4_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if $button_unpressed/Button57.visible and $button_unpressed/Button3b.visible and $button_unpressed/Button22.visible:
			$click_button.play()
			$button_unpressed/ButtonD4.visible = false
			count_click += 1
			check_win()


func click_key(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$pickup_key.play()
		$KeyBox/KeY.visible = false
		Global.isKey = true

var all_screw_clicked = 0  # Counter for tracking how many screws are clicked
var skru1 = false
var skru2 = false
var skru3 = false
var skru4 = false

func check_all_screws_clicked() -> void:
	if skru1 and skru2 and skru3 and skru4:
		Global.isPanel = true
		await get_tree().create_timer(2).timeout
		$TablePanel.visible = false
		$open_panel.play()



# Function to check if any animation is playing
func is_any_animation_playing() -> bool:
	# Check if the current animation is one of the screw animations
	var current_anim = $TablePanel/skru1_anim.current_animation
	return current_anim == "skru1_anim" or current_anim == "skru2_anim" or current_anim == "skru3_anim" or current_anim == "skru4_anim"

# Function for clicking screw1
func screw1(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if Global.isScrewdriver:
			if not is_any_animation_playing():
				$TablePanel/Skru1/Area2D/Screwdriver.visible = true
				$drill.play()
				shake_timer = shake_duration
				await get_tree().create_timer(0.5).timeout
				$TablePanel/Skru1/Area2D/Screwdriver.visible = false
				await get_tree().create_timer(0.1).timeout
				$pop.play()
				$TablePanel/skru1_anim.play("skru1_anim")
				skru1 = true
				check_all_screws_clicked() 

# Function for clicking screw2
func click_screw2(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if Global.isScrewdriver:
			if not is_any_animation_playing():
				$TablePanel/Skru2/Area2D2/Screwdriver2.visible = true
				$drill.play()
				shake_timer = shake_duration
				await get_tree().create_timer(0.5).timeout
				$TablePanel/Skru2/Area2D2/Screwdriver2.visible = false
				await get_tree().create_timer(0.1).timeout
				$pop.play()
				$TablePanel/skru1_anim.play("skru2_anim")
				await get_tree().create_timer(0.5).timeout  
				skru2 = true
				check_all_screws_clicked()  

# Function for clicking screw3
func click_skru3(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if Global.isScrewdriver:
			if not is_any_animation_playing():
				$TablePanel/Skru3/Area2D3/Screwdriver3.visible = true
				$drill.play()
				shake_timer = shake_duration
				await get_tree().create_timer(0.5).timeout
				$TablePanel/Skru3/Area2D3/Screwdriver3.visible = false
				await get_tree().create_timer(0.1).timeout
				$pop.play()
				$TablePanel/skru1_anim.play("skru3_anim")
				skru3 = true
				check_all_screws_clicked()  

# Function for clicking screw4
func click_skru4(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if Global.isScrewdriver:
			if not is_any_animation_playing():
				$TablePanel/Skru4/Area2D4/Screwdriver4.visible = true
				$drill.play()
				shake_timer = shake_duration
				await get_tree().create_timer(0.5).timeout
				$TablePanel/Skru4/Area2D4/Screwdriver4.visible = false
				await get_tree().create_timer(0.1).timeout
				$pop.play()
				$TablePanel/skru1_anim.play("skru4_anim")
				skru4 = true
				check_all_screws_clicked()  
