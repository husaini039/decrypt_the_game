extends Sprite2D


var shake_strength := 0.0005
var original_position := Vector2.ZERO
var shake_decay := 0.99  # Gradual decrease over time
var shake_intensity := 1.0  # Starting intensity

func _ready():
	original_position = position
	randomize()

func _process(delta):
	# Gradually reduce the shake intensity
	shake_intensity *= shake_decay
	var offset = Vector2(
		randf_range(-shake_strength * shake_intensity, shake_strength * shake_intensity),
		randf_range(-shake_strength * shake_intensity, shake_strength * shake_intensity)
	)
	position = original_position + offset
