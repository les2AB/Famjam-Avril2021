extends Node

onready var niveau1 = preload("res://game2/scenes/Niveaux/Niveau_Bruno.tscn")
onready var niveau2 = preload("res://game2/scenes/Niveaux/Niveau_eloise.tscn")
onready var niveau3 = preload("res://game2/scenes/Niveaux/Niveau_thilou.tscn")
onready var niveau4 = preload("res://game2/scenes/Niveaux/Niveau_Olgaline.tscn")

onready var niveaux = [niveau1,niveau2,niveau3,niveau4]


var princessePoints
var princesseVie
var level


func changeNiveau():		
	level += 1
	var niveau = niveaux[level]
	var _ignore = get_tree().change_scene_to(niveau)
	var GUI = get_tree().get_root().find_node("GUI",true, false)
	GUI.change_valPoints(princessePoints)
	print("points :",princessePoints)