extends Node2D


onready var world = get_parent()
onready var niveau1 = preload("res://game2/scenes/Niveaux/Niveau_Bruno.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalGame2.princessePoints = 0
	GlobalGame2.princesseVie = 3
	GlobalGame2.level = -1
	GlobalGame2.chargeNiveau()

	


func _input(event):
	if event is InputEventKey and event.is_pressed():
		var letter = event.scancode
		if  letter == KEY_ESCAPE:
			_leave_game()



# retour à la salle d'arcade
func _leave_game() -> void:
	world._loader_start( 1 )
	queue_free()
