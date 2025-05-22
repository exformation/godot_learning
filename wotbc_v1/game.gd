extends Node2D

var card = preload("res://card.tscn")

func _ready() -> void:
	var c = card.instantiate()
	add_child(c)
