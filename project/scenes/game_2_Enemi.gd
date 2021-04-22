extends KinematicBody2D

export (int) var speed : int = 50
export (int) var gravity = -200


var velocity= Vector2.ZERO



func _ready():
	velocity.y += -self.gravity
	velocity.x= 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
var state
enum {MARCHE, TOMBE}

func _process(delta):
	if velocity.y != 0:
		state = TOMBE
		velocity.y += -self.gravity * delta
	else:
		state = MARCHE
	
	

	move_and_slide(velocity, Vector2(0,1))




func _on_Area2D_body_entered(body:Node):
	if body != self:
		print("collision avec ", body.name) 
		if body.name == "Princesse":
			mourir()

func mourir():
	print ("enemi meurt")


func _on_Pieds_body_entered(body):
	if body != self:

		state == MARCHE
		velocity.x = self.speed


func _on_Corps_body_entered(body):
	velocity.x *= -1
