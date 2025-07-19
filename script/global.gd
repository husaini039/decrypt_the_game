extends Node
#LEADERBOARD
var score = 0
var player_name = ""

func _ready() -> void:
	SilentWolf.configure({
		"api_key": "HuDckp0Brj2fdO0k66sE41Mwgb1fDCoI1Ce7CiTA",
		"game_id": "decryptleaderboard",
		"log_level": 1
	})
	
	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scene/main_menu.tscn"
	})

var start_dialogue_shown := false
var point_cursor = preload("res://asset/cursor/pointer.png")
var default_cursor = null
var is_dragging = false

#for picture pieces
var pieces1 = false
var pieces2 = false
var pieces3 = false
var pieces4 = false

var pieces1_clicked = false
var pieces2_clicked = false
var pieces3_clicked = false
var pieces4_clicked = false

var frame_complete = false

var cracked_window = false

#hammer
var isPanelPuzzle = false
var isScrewdriver = false
var isKey = false
var isPanel = false
var isHammer = false
var won_table_puzzle = false

var isBoard = false

#opening
var done_opening = false


#timer

var duration := 1800.0  # seconds
var time_elapsed := 0.0
var running := false
var has_triggered_time_up := false
var time_remaining := 0.0
var game_over_scene := "res://scene/game_over.tscn"

var isPause = false
func _unhandled_input(event: InputEvent) -> void:
	if running:
		if event.is_action_pressed("escape"):
			if !isPause:
				var pause_scene = preload("res://scene/pause_scene.tscn").instantiate()
				get_tree().root.add_child(pause_scene)
				isPause = true



func _process(delta: float) -> void:
	if running and !has_triggered_time_up and !isPause:
		time_elapsed += delta
		if time_elapsed >= duration:
			has_triggered_time_up = true
			running = false
			_handle_time_up()


func start_countdown() -> void:
	time_elapsed = 0.0
	running = true
	has_triggered_time_up = false

func _handle_time_up() -> void:
	print("⏰ Time's up! Changing to Game Over scene...")
	get_tree().change_scene_to_file("res://scene/game_over_scene.tscn")
	reset_globals()

func get_time_remaining() -> float:
	if running:
		return max(duration - time_elapsed, 0.0)
	return duration

func get_time_as_minutes_seconds() -> Array:
	var total_seconds := int(get_time_remaining())
	var minutes := total_seconds / 60
	var seconds := total_seconds % 60
	return [minutes, seconds]  # returns [minutes, seconds] as integers

var show_new_cabinet_livingRoom := false

var coll := false

func set_hand_cursor():
	Input.set_custom_mouse_cursor(point_cursor)

func reset_cursor():
	Input.set_custom_mouse_cursor(default_cursor)

func reset_globals():
	start_dialogue_shown = false
	is_dragging = false

	pieces1 = false
	pieces2 = false
	pieces3 = false
	pieces4 = false

	pieces1_clicked = false
	pieces2_clicked = false
	pieces3_clicked = false
	pieces4_clicked = false

	frame_complete = false
	cracked_window = false

	isPanelPuzzle = false
	isScrewdriver = false
	isKey = false
	isPanel = false
	isHammer = false
	won_table_puzzle = false
	isBoard = false

	done_opening = false

	# timer
	duration = 1800.0
	time_elapsed = 0.0
	running = false
	has_triggered_time_up = false
	game_over_scene = "res://scene/game_over_scene.tscn"

	show_new_cabinet_livingRoom = false
	coll = false
