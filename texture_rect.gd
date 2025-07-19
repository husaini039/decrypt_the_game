extends TextureRect

func _get_drag_data(at_position):
	if not texture:
		return null  # Nothing to drag

	var preview_texture = TextureRect.new()
	preview_texture.texture = texture
	preview_texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED

	var max_size = 250.0
	var original_size = texture.get_size()
	var scale_factor = min(max_size / original_size.x, max_size / original_size.y, 1.0)
	preview_texture.size = original_size * scale_factor

	var preview = Control.new()
	preview.add_child(preview_texture)
	set_drag_preview(preview)

	var drag_data = {
		"texture": texture,
		"origin": self  # Track where it came from
	}

	texture = null  # Temporarily clear

	return drag_data


func _can_drop_data(_pos, data):
	return typeof(data) == TYPE_DICTIONARY and data.has("texture") and data["texture"] is Texture2D

func _drop_data(_pos, data):
	texture = data["texture"]
