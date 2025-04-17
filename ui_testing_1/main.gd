extends VBoxContainer

func _ready() -> void:
	%PaceButton.grab_focus()
	%PaceButton.item_selected.connect(_on_pace_changed)
	_on_pace_changed()

func _on_pace_changed(index:int = 0) -> void:
	%FixedPaceSpeed.get_parent().visible = (%PaceButton.text == "fixed")
