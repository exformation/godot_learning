extends Node2D

const CUE = preload("res://cue.tscn")
#@onready var game_layer: CanvasLayer = $GameLayer
@onready var cam: Camera2D = $Camera2D


func _ready() -> void:
	cam.offset = Vector2(0, get_viewport_rect().size.y / 2)
	var cue := CUE.instantiate()
	var win_height := cam.get_viewport().get_visible_rect().size.y
	var cue_height := int(cue.size.y) + 10
	var pos := cue_height
	while pos < win_height: 
		cue = CUE.instantiate()
		add_child(cue)
		cue.position.y = pos
		pos += cue_height
		cue.get_node("C1/Label").text = 'what'
		#cue.choices = [...]
		
	
