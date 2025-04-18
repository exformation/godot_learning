class_name Game
extends Node2D

const CUE = preload("res://cue.tscn")
@onready var cam: Camera2D = $Camera2D
var win_height := 0 
var cue_height := 0
var pos := 0
var cues:Array[Cue] = []

func _ready() -> void:
	win_height = cam.get_viewport().get_visible_rect().size.y
	pos = 0
	cam.offset = Vector2(0, get_viewport_rect().size.y / 2)
	#cue_height = CUE.instantiate().size.y + 10
	while pos < win_height: 
		spawn()
	check_bounds()

func _process(delta: float) -> void:
	%FPS.text = str(Engine.get_frames_per_second())

func spawn():
	var cue = CUE.instantiate()
	cues.append(cue)
	add_child(cue)
	cue.position.y = pos
	cue.cue_timeout.connect(timeout)
	pos += cue.size.y + 10

var keycodes = {
	KEY_D: 0, KEY_F: 1, KEY_J: 2, KEY_K: 3
}

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not cues.is_empty():
		var cue: Cue = cues.front()
		var i = keycodes.get(event.keycode,null)
		if i!=null and event.pressed:
			cue.receive_input(i)
	check_bounds()
	
func timeout():
	var cue:Cue = cues.front()
	if cue.check():
		cues.pop_front()
		cam.position.y += cue.size.y + 10
	else: 
		print('you done fucked up')
		cue.reset_expected()

func check_bounds():
	if cues.back().position.y < cam.position.y+win_height:
		spawn()
	if cues.front().position.y < cam.position.y-cue_height:
		cues.pop_front().queue_free()
