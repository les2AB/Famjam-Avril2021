extends Control

onready var jump1:AudioStreamPlayer2D= get_node("jump1")


func _ready():
	pass # Replace with function body.


func play_jump():
	jump1.playing = true