extends Sprite

# modifier l'index dans la scène
export (int) var game_index = 1


# modifier l'index dans la scène
func _on_Area2D_body_entered(_body):
	var arcade= get_parent()
	var world = arcade.get_parent()
	
	world.on_game_start(game_index)
	arcade.queue_free()
