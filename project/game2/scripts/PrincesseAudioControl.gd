extends Control

onready var jump1:AudioStreamPlayer2D= get_node("jump1")
onready var jump2:AudioStreamPlayer2D= get_node("jump2")
onready var jump3:AudioStreamPlayer2D= get_node("jump3")
onready var jump4:AudioStreamPlayer2D= get_node("jump4")
onready var jump5:AudioStreamPlayer2D= get_node("jump5")

var audio_jumps

func _ready():
	audio_jumps= [jump1, jump2, jump3, jump4, jump5]


func play_jump():
	audio_jumps [ randi() % len(audio_jumps)].playing = true
