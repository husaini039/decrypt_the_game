extends PanelContainer

@onready var texture_rect = $TextureRect


func _get_drag_data(at_position):
	return texture_rect
	

func _can_drop_data(_pos, data):
	return data is TextureRect
	
func _drop_data(_pos, data):
	var temp = texture_rect.texture
	texture_rect.texture = data.texture
	data.texture = temp
	
	
