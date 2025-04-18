class_name Cue
extends HBoxContainer

var orig: Array[int] = []
var choices: Array[int] = []
var expected: Array[int] = []
var expr := Expression.new()
var expression: StringName = 'x%2'

@onready var timer: Timer = $Timer

signal cue_timeout

func generate_choices(n: int, a: int, b: int, x: int, y: int, condition: Callable) -> Array[int]:
	var result:Array[int] = []
	while result.size() < randi_range(a, b):
		var num := randi_range(x,y)
		if condition.call(num) == 0:
			result.append(num)
	while result.size() < n:
		var num := randi_range(x,y)
		if condition.call(num) != 0:
			result.append(num)
	result.shuffle()
	return result
	
func condition(x: int) -> int: 
	return expr.execute([x])

func _ready():
	expr.parse(expression, ["x"])
	var values := generate_choices(get_child_count()-1, 1, 4, 0, 1000, condition)
	for i in range(1, get_child_count()):
		var child: Choice = get_child(i)
		var num := values[i - 1]
		child.set_choice(num)
		choices.append(num)
		expected.append(condition.call(num))
	orig = expected.duplicate()

func receive_input(pos: int):
	expected[pos] ^= 1
	if timer.is_stopped():
		timer.start()

func check() -> bool:
	return expected.all(func(v): return v==1)

func _on_timer_timeout():
	cue_timeout.emit()

func reset_expected(): 
	expected = orig.duplicate()
