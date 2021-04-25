extends Node2D

#onready var gameNode = get_tree().get_root().get_node("game_2bis")

onready var world = get_parent()
#onready var Niveau = get_node("Niveau")
onready var niveau1 = preload("res://game2/scenes/Niveaux/Niveau_Bruno.tscn").instance()
onready var niveau2 = preload("res://game2/scenes/Niveaux/Niveau_eloise.tscn").instance()
onready var niveau3 = preload("res://game2/scenes/Niveaux/Niveau_thilou.tscn").instance()
onready var niveau4 = preload("res://game2/scenes/Niveaux/Niveau_Olgaline.tscn").instance()

onready var niveaux = [niveau1,niveau2,niveau3,niveau4]


var level
var princessePoints = 0
var princesseVie = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	level = 0
	add_child(niveaux[level])
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _input(event):
	if event is InputEventKey and event.is_pressed():
		var letter = event.scancode
		if  letter == KEY_ESCAPE:
			_leave_game()



# retour à la salle d'arcade
func _leave_game() -> void:
	world._loader_start( 1 )
	queue_free()

func changeNiveau():
			
	level += 1
	add_child(niveaux[level])
	remove_child(niveaux[level-1])
	var GUIScript = get_tree().get_root().find_node("GUI",true, false)
	GUIScript.change_valPoints(princessePoints)
	print("points :",princessePoints)
	
	
	
	# else :
	# 	var _ignore= get_tree().change_scene("res://arcade/arcade.tscn")
