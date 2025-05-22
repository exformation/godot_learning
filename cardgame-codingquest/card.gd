extends Container

@onready var card = preload('res://card_holder.tscn')
var startPosition
var cardHighlighted = false

func _on_mouse_entered() -> void:
	$AnimationPlayer.play('select')
	cardHighlighted = true


func _on_mouse_exited() -> void:
	$AnimationPlayer.play('deselect')
	cardHighlighted = false


func _on_gui_input(event: InputEvent) -> void:
	var mouse_event := event as InputEventMouseButton
	if mouse_event and mouse_event.button_index == MOUSE_BUTTON_LEFT:
		if mouse_event.pressed:
			print('pressed')
			if cardHighlighted:
				var temp = card.instantiate()
				$"/root/Board/CardHolder".add_child(temp)
				Game.cardSelected = true
				$Sprite2D.hide()
		else:
			print('released')
			if !Game.mouseOnPlacement:
				# place back in hand
				cardHighlighted = false
				$Sprite2D.show()
			else:
				# place on board
				queue_free()
