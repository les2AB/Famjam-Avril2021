extends Node2D


onready var world = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _input(event):
	if event is InputEventKey and event.is_pressed():
		var letter = event.scancode
		if  letter == KEY_ESCAPE:
			_leave_game()



# retour à la salle d'arcade
func _leave_game() -> void:
	world._loader_start( 1 )
	queue_free()
