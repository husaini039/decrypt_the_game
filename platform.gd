extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)

func _process(delta: float) -> void:
	if Global.is_dragging:
		visible = true
	else:
		visible = false
