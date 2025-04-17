class_name Choice
extends Panel

@onready var label: Label = $Label

func set_choice(val):
	label.text = str(val)
