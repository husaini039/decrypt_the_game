extends GridContainer

var player_list_pos = []

func _ready() -> void:
	var sw_result: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	print("Scores: " + str(sw_result.scores))
