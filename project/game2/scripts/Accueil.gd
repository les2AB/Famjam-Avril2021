extends Node2D

onready var game2 = preload("res://game2/game_2.tscn")
	
func _input(event):
	if event is InputEventScreenTouch or (event is InputEventKey and event.is_action_pressed("ui_accept")):
		var _ignore= get_tree().change_scene_to(game2)
