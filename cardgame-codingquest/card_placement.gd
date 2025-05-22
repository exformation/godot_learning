extends Control



func _on_mouse_entered() -> void:
	Game.mouseOnPlacement = true
	print('on')


func _on_mouse_exited() -> void:
	Game.mouseOnPlacement = false
	print('off')
