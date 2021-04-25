extends CanvasLayer

onready var coeurPlein = preload("res://game2/img/coeurs/coeur plein.png")
#onready var coeurVide = preload("res://game2/img/coeurs/coeur vide.png")
# onready var vies = get_node("Vies")

# Called when the node enters the scene tree for the first time.
func _ready():
	#$Points_score.text = "0"
	$Vies_score.text = "3"
	for i in range(GlobalGame2.princesseVie):
		$Vies.get_child(i).texture = coeurPlein

func change_valPoints(pieces):	
	$Points_score.text = str(pieces)
	#$Points_score.update()
	
func changeVie(vie):
	print("vie :",vie)
	

