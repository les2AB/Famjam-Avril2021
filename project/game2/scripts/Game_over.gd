extends Node2D


func _input(event):
	if event is InputEventScreenTouch or (event is InputEventKey and event.is_action_pressed("ui_accept")):
		var _ignore= get_tree().change_scene("res://game2/game_2.tscn")
