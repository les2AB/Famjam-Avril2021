extends AnimatedSprite

onready var Princesse = get_tree().get_root().find_node("Princesse",true, false)

onready var GUIScript = get_tree().get_root().find_node("GUI",true, false)

func _on_Area2D_body_entered(body):
    if body == self or body.is_in_group('ennemis'):
        return
    Princesse.points += 1
    GUIScript.change_valPoints(Princesse.points)
    print(Princesse.points)
    queue_free()
