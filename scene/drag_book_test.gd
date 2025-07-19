extends Node2D

var selected = false
var rest_point
var rest_nodes = []
var drag_offset = Vector2.ZERO
var current_zone = null

func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	if rest_nodes.size() > 0:
		rest_point = rest_nodes[0].global_position
		rest_nodes[0].select()
		current_zone = rest_nodes[0]

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		selected = true
		drag_offset = global_position - get_global_mouse_position()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		selected = false
		var closest_zone = null
		var shortest_dist = 75

		for zone in rest_nodes:
			var distance = global_position.distance_to(zone.global_position)
			if distance < shortest_dist:
				shortest_dist = distance
				closest_zone = zone

		if closest_zone != null:
			closest_zone.select()
			current_zone = closest_zone
			rest_point = current_zone.global_position
		else:
			# If not near any zone, return to previous rest point
			if current_zone != null:
				current_zone.select()

func _physics_process(delta):
	if selected:
		var target_position = get_global_mouse_position() + drag_offset
		global_position = lerp(global_position, target_position, 25 * delta)

		# Real-time hover detection
		var closest_zone = null
		var shortest_dist = 75
		for zone in rest_nodes:
			var distance = global_position.distance_to(zone.global_position)
			if distance < shortest_dist:
				shortest_dist = distance
				closest_zone = zone

		# Update zone highlight only if changed
		if closest_zone != null and closest_zone != current_zone:
			if current_zone != null:
				current_zone.deselect()
			closest_zone.select()
			current_zone = closest_zone

	elif current_zone != null:
		global_position = lerp(global_position, current_zone.global_position, 10 * delta)
