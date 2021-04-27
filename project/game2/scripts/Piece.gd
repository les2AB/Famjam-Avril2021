extends AnimatedSprite

#onready var Princesse = get_tree().get_root().find_node("Princesse",true, false)
#onready var GameNode = get_tree().get_root().find_node("game_2bis",true, false)

var audio_pieces
var GUIScript
func _ready():
	audio_pieces= [$AudioControleur/piece1, $AudioControleur/piece2, $AudioControleur/piece3]
	GUIScript = get_tree().get_root().find_node("GUI_score_vie",true, false)


func _on_Area2D_body_entered(body):
	if body == self or body.is_in_group('ennemis'):
		return
	
	self.visible= false
	
	GlobalGame2.princessePoints += 1
	GUIScript.change_valPoints(GlobalGame2.princessePoints)
	
	var son= audio_pieces[ randi() % len(audio_pieces) ]
	son.play()
	yield(son, 'finished')
	queue_free()
	
