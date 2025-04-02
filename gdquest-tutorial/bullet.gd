extends Area2D

func _ready() -> void:
	await get_tree().create_timer(0.5).timeout 
	queue_free()

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * delta * 1000


func _on_body_entered(body: Node2D) -> void:
	if body.has_method('take_damage'):
		body.take_damage()
	queue_free()
