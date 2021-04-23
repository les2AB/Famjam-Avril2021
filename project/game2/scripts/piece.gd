extends AnimatedSprite

onready var princesse = get_tree().get_root().find_node("princesse",true,false)

func _on_Area2D_body_entered(body):
    princesse.points += 1
    print(princesse.points)
    queue_free()