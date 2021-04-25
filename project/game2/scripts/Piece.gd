extends AnimatedSprite

#onready var Princesse = get_tree().get_root().find_node("Princesse",true, false)
onready var GameNode = get_tree().get_root().find_node("game_2bis",true, false)
onready var GUIScript = get_tree().get_root().find_node("GUI",true, false)

var audio_pieces
func _ready():
	audio_pieces= [$AudioControleur/piece1, $AudioControleur/piece2, $AudioControleur/piece3]


func _on_Area2D_body_entered(body):
	if body == self or body.is_in_group('ennemis'):
		return
	var son= audio_pieces[ randi() % len(audio_pieces) ]
	son.play()
	queue_free()
	
	GameNode.princessePoints += 1
	GUIScript.change_valPoints(GameNode.princessePoints)
	print("point :",GameNode.princessePoints)
	yield(son, 'finished')
	