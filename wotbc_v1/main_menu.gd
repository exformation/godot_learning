extends Control

@onready var playbutton: Button = %Play

func _ready() -> void:
	%Play.grab_focus()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://settings.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
