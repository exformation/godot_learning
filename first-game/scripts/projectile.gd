class_name Projectile
extends Area2D

var direction: Vector2


func _ready() -> void:
	await get_tree().create_timer(10).timeout 
	queue_free()

func _physics_process(delta: float) -> void:
	position += direction * delta * 200



func _on_body_entered(body: Node2D) -> void:
	
	if body.is_in_group('monsters'):
		print('hello?')
		queue_free()
	#if body.get_groups()
