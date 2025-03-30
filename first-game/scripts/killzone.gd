extends Area2D

#@onready var timer: Timer = $TimerO

func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free() # make him fall
	#timer.start()
	await get_tree().create_timer(1.0).timeout
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()

#func _on_timer_timeout() -> void:
	#Engine.time_scale = 1
	#get_tree().reload_current_scene()
