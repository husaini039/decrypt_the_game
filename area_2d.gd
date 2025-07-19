extends Area2D


func _on_mouse_entered() -> void:
	Global.set_hand_cursor()


func _on_mouse_exited() -> void:
	Global.reset_cursor() 
