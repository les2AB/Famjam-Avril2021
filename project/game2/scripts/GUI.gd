extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	#$Points_score.text = "0"
	$Vies_score.text = "3"

func change_valPoints(pieces):	
	$Points_score.text = str(pieces)
	#$Points_score.update()
	
