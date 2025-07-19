extends PanelContainer

@onready var texture_rect = $TextureRect

@onready var ppl_book = preload("res://asset/book/purple_book.JPG")
var target_book  = get_node_or_null("ui/GridContainer2/PanelContainer4/TextureRect")

func _get_drag_data(at_position):
	set_drag_preview(get_preview())
	return texture_rect
	

func _can_drop_data(_pos, data):
	return data is TextureRect
	
func _drop_data(_pos, data):
	var temp = texture_rect.texture
	texture_rect.texture = data.texture
	data.texture = temp
	#correct_book()
	
	
func get_preview():
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture_rect.texture
	preview_texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED  # Better than expand_mode = 1
	preview_texture.size = Vector2(50, 125)

	var preview = Control.new()
	preview.add_child(preview_texture)

	# Offset to center the texture under the mouse
	preview_texture.position = -preview_texture.size / 2

	return preview
