extends Control

onready var part1 = get_node("Musique_partie_1")
onready var part2 = get_node("Musique_partie_2")
onready var part3 = get_node("Musique_partie_3")

var _musiques

var nb_boucle
var boucle_index
var morceau:AudioStreamPlayer

func _ready():
	_musiques = [part1, part2, part3]
	morceau = _musiques[ 0 ]
	play_musique(null, null)




func play_musique(old_index, new_index):
	# choisir nouvelle partie
	if new_index == null:
		new_index = randi() % len(_musiques)
		while new_index == old_index:
			new_index = randi() % len(_musiques)
		print (new_index)

		# joue entre 4 et 8 boucles
		nb_boucle = 4 + randi() % 5
		boucle_index= 0

	morceau.playing = false
	morceau = _musiques[ new_index ]
	morceau.playing = true

func gere_parties(part_id):
	print ('musique part",part_id," finie')
	boucle_index += 1
	if boucle_index >= nb_boucle:
		# print ('change')
		play_musique(part_id-1 ,null)
	else:
		# print ('recommence : ', boucle_index, " ", nb_boucle)
		play_musique(part_id-1 ,part_id-1)


func _on_Musique_partie_1_finished():
	gere_parties(1)

func _on_Musique_partie_2_finished():
	gere_parties(2)

func _on_Musique_partie_3_finished():
	gere_parties(3)

	
