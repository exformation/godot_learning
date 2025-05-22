extends Node2D

func _ready() -> void:
	spawn_mob()
	spawn_mob()
	DirAccess.open(OS.get_executable_path())

func spawn_mob():
	var mob = preload('res://mob.tscn').instantiate()
	%PathFollow2D.progress_ratio = randf()
	mob.global_position = %PathFollow2D.global_position
	add_child(mob)


func _on_spawn_timer_timeout() -> void:
	spawn_mob()


func _on_player_dead() -> void:
	%GameOver.visible = true
	get_tree().paused = true
