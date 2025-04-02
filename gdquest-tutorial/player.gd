extends CharacterBody2D

signal dead

var health: float = 100

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector('move_left','move_right','move_up','move_down')
	velocity = direction * 600
	move_and_slide()
	
	if velocity: 
		#get_node("HappyBoo").play_walk_animation()
		$HappyBoo.play_walk_animation()
	else:
		#get_node("HappyBoo").play_idle_animation()
		$HappyBoo.play_idle_animation()
		
	const DMGRATE = 50.0
	var overlapping = %HurtBox.get_overlapping_bodies()
	health -= DMGRATE*overlapping.size()*delta
	%ProgressBar.value = health
	if health <= 0: 
		dead.emit()
		#queue_free()
	#Input.get_vector()
