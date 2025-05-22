extends Button

func _ready() -> void:
	text = name


func _on_pressed() -> void:
	match name:
		"Play": get_tree().change_scene_to_file("res://game.tscn")
		"Settings": get_tree().change_scene_to_file("res://settings.tscn")
		"Quit": get_tree().quit()
