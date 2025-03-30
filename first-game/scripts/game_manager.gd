extends Node

var score = 0 
@onready var label: Label = $Label
@onready var pickup_sound: AudioStreamPlayer2D = $PickupSound

func inc_score():
	score += 1 
	label.text = str(score)
	#pickup_sound.play()
	print(score)
