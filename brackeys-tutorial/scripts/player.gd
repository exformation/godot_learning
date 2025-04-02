extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		animated_sprite.flip_h = direction<0
		animated_sprite.play("run")
		velocity.x = direction * SPEED 
	else:
		animated_sprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.x = max(velocity.x-SPEED,0)
		
	if not is_on_floor():
		animated_sprite.play("jump")
		velocity += get_gravity() * delta

	move_and_slide()
	
const PROJECTILE = preload('res://scenes/projectile.tscn')
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var fruit: Projectile = PROJECTILE.instantiate()
		fruit.position = position
		fruit.direction = position.direction_to(get_global_mouse_position())
		fruit.visible = true
		get_parent().add_child(fruit)
		
