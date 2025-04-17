class_name Cue
extends HBoxContainer

var choices:Array[int] = []
var expected:Array[int] = []
@onready var timer: Timer = $Timer

var expression:StringName = 'x%2'

signal cue_timeout

func generate_choices(n: int, a: int, b: int, x: int, y: int, condition: Callable) -> Array[int]:
	var result:Array[int] = []
	while result.size() < randi_range(a, b):
		var num := randi_range(x,y)
		if condition.call(num):
			result.append(num)
	while result.size() < n:
		var num := randi_range(x,y)
		if not condition.call(num):
			result.append(num)
	result.shuffle()
	return result
	
func condition(x): 
	var e := Expression.new()
	e.parse(expression, ["x"])
	return e.execute([x])

func _ready():
	var values := generate_choices(get_child_count()-1, 1, 3, 1, 100, condition)
	for i in range(1, get_child_count()):
		var child: Choice = get_child(i)
		var num := values[i - 1]
		child.set_choice(num)
		choices.append(num)
		expected.append(condition.call(num))

func receive_input(pos: int):
	expected[pos] ^= 1
	print(expected)
	if timer.is_stopped():
		timer.start()

func check() -> bool:
	print(expected)
	return expected.all(func(v): return v==1)


func _on_timer_timeout() -> void:
	cue_timeout.emit()
