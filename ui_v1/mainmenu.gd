extends Control

func _ready() -> void:
	%Play.grab_focus()
	
	
	#var char := "1"
	#var key := InputEventKey.new()
	#key.keycode = char.unicode_at(0)
#
	#%Play.text += char
	#%Play.shortcut = Shortcut.new()
	#%Play.shortcut.events = [key]
	#%Play.pressed.connect(func(): print('what'))

	var buttons := %Buttons.get_children()
	for i in buttons.size():
		var key := InputEventKey.new()
		key.keycode = str(i + 1).unicode_at(0)
		buttons[i].shortcut = Shortcut.new()
		buttons[i].shortcut.events = [key]
		buttons[i].text = buttons[i].name
		buttons[i].pressed.connect(func(): buttons[i].grab_focus())

# this can be called twice if you move the mouse while releasing??
#func _input(event: InputEvent) -> void:
	#if Input.is_action_just_released("left_click"):
		#print('???')

func _input(event: InputEvent) -> void:
	if event.is_action_released("left_click"):
		print('???')
