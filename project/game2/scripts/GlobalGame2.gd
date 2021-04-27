extends Node

onready var bac_sable = preload("res://game2/scenes/Niveaux/Niveau_BacSable_Pascal.tscn")
onready var niveau1 = preload("res://game2/scenes/Niveaux/Niveau_Bruno.tscn")
onready var niveau2 = preload("res://game2/scenes/Niveaux/Niveau_eloise.tscn")
onready var niveau3 = preload("res://game2/scenes/Niveaux/Niveau_thilou.tscn")
onready var niveau4 = preload("res://game2/scenes/Niveaux/Niveau_Olgaline.tscn")

# MODE sandbox
onready var niveaux = [bac_sable, niveau4]
# onready var niveaux = [niveau1,niveau2,niveau3,niveau4]


var princessePoints
var princesseVie
var level


func chargeNiveau():		
	level += 1
	var niveau = niveaux[level]
	var _ignore = get_tree().change_scene_to(niveau)
		
	print("points :",princessePoints)
