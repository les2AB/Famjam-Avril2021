extends KinematicBody2D

export (int) var speed : int = 200
export (int) var gravity = -200


var velocity= Vector2.ZERO

func _ready():
	velocity.y += -self.gravity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.y += -self.gravity * delta

	for i in get_slide_count():
		var collision = get_slide_collision(i)
		# print("collision avec ", collision.collider.name)
		velocity.y= 0