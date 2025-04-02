extends Area2D

func _physics_process(delta: float) -> void:
	var enemies = get_overlapping_bodies()
	if enemies.size()>0:
		var target = enemies.front() 
		look_at(target.global_position)

func shoot():
	const BULLET = preload('res://bullet.tscn')
	var bullet = BULLET.instantiate()
	bullet.global_position = %ShootingPoint.global_position
	bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(bullet)

func _on_timer_timeout() -> void:
	shoot()
