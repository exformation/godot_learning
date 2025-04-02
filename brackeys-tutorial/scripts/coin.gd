extends Area2D

@onready var game_manager := %GameManager
@onready var pickup_sound: AudioStreamPlayer2D = $PickupSound


func _on_body_entered(body: Node2D) -> void:
	game_manager.inc_score()
	pickup_sound.play()
	self.visible = false
	get_node('CollisionShape2D').queue_free()
	await pickup_sound.finished
	queue_free()
