extends Sprite

var level

func _ready():
	level = 1
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if level < 5:
		print("change scene")
		level += 1
	else :
		print("game over")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
