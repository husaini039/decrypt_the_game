extends Sprite2D

var shake_strength := 1
var original_position := Vector2.ZERO

func _ready():
	original_position = position
	randomize()

func _process(delta):
	var offset = Vector2(
		randf_range(-shake_strength, shake_strength),
		randf_range(-shake_strength, shake_strength)
	)
	position = original_position + offset
