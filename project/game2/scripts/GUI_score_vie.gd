extends CanvasLayer

onready var coeurPlein = preload("res://game2/img/coeurs/coeur plein.png")


func _ready():	
	change_valPoints(GlobalGame2.princessePoints)
	for i in range(GlobalGame2.princesseVie):
		$Vies.get_child(i).texture = coeurPlein

func change_valPoints(pieces):	
	$Points_score.text = str(pieces)
	$Points_score.update()
	

