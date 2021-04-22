extends Node2D

# onready var game2= preload("res://game2/scènes/game_2.tscn")
	
func _input(event):
	if event is InputEventScreenTouch or event is InputEventKey:
		var _ignore= get_tree().change_scene("res://game2/scenes/game_2.tscn")
