class_name EnnemiAudioControl
extends Control

onready var scream1= get_node("scream1")
onready var scream2= get_node("scream2")
onready var scream3= get_node("scream3")
onready var scream4= get_node("scream4")

var audio_screams

func _ready():
	audio_screams = [scream1, scream2, scream3, scream4]

func play_scream():
	audio_screams [ randi() % len (audio_screams)].playing = true