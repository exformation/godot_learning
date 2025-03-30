extends CharacterBody2D
class_name Slime

var health: int = 3

@onready var player = get_node('/root/Game/Player')
#@export var player: Node2D

func _ready() -> void:
	#player = get_node('/root/Game/Player')
	%Slime.play_walk()

func _physics_process(delta: float) -> void:
	var direction: Vector2 = global_position.direction_to(player.global_position)
	velocity = direction * 200
	move_and_slide()

func take_damage():
	%Slime.play_hurt()
	health -= 1
	if health <= 0:
		queue_free()
		const SMOKE_EXPLOSION = preload('res://smoke_explosion/smoke_explosion.tscn')
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
