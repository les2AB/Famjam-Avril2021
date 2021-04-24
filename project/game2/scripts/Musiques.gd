extends Control

onready var musique = get_node("Musique")

	
func _on_Intro_Gimmick_finished():
	musique.playing = true