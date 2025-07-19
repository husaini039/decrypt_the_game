extends CanvasLayer

func _ready():
	update_ui()

func _process(_delta):
	update_ui()

func update_ui():
	var time_left = Global.get_time_remaining()
	var minutes = int(time_left) / 60
	var seconds = int(time_left) % 60

	$Label.text = "%02d:%02d" % [minutes, seconds]
