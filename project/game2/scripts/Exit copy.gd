extends Sprite


onready var gameNode = get_tree().get_root().get_node("game_2bis")

signal endLevel()

func _ready():
	connect("endLevel",gameNode,"changeNiveau")	
	

func _on_Area2D_body_entered(body):
	if body.is_in_group('princesse'):
		print("exit")		
		emit_signal("endLevel")
	
	

	#var _ignore= get_tree().change_scene("res://arcade/arcade.tscn")

	### En attendant...
	# if level < 5:
	# 	print("change scene")
	# 	level += 1
	# else :
	# 	print("game over")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
