extends AnimatedSprite

onready var Princesse = get_tree().get_root().find_node("Princesse")

func _on_Area2D_body_entered(body):
    Princesse.points += 1
    print(Princesse.points)
    queue_free()