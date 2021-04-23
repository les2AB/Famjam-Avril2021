extends KinematicBody2D

export (int) var speed : int = 50
export (int) var gravity = -981


onready var ennemiAudioControl= get_node("EnnemiAudioControl")

var velocity= Vector2.ZERO


func _ready():
	add_to_group('ennemis')
	velocity.y += 0
	velocity.x= -1 * self.speed
	$AnimatedSprite.flip_h = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
var state
enum {MARCHE, TOMBE}

func _process(delta):
	
	velocity.y += -self.gravity * delta
	
	if is_on_floor():
		stop_vertical()

	if is_on_wall():
		demi_tour()

	var _ignore= move_and_slide(velocity, Vector2(0,-1))



func mourir():
	print ("enemi meurt")
	ennemiAudioControl.play_scream()
	$AnimatedSprite.play("meurt")
	# $Move_collision.set_deferred('disabled', true)
	$Move_collision.shape.extents= Vector2(0.1,0.001)
	$Move_collision.position += Vector2(0,9)
	# $Move_collision.set_deferred('disabled', true)
	$Hit_collision/CollisionCorps.set_deferred('disabled', true)


func stop_vertical():
	velocity.y= 0

func demi_tour():
	velocity.x *= -1
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == 'meurt':
		$AnimatedSprite.playing = false
		velocity= Vector2.ZERO
		# queue_free()



func _on_Hit_collision_body_entered(body):
	if body == self:
		return

	if body.name == 'Princesse':
		print ("ennemi meurt")
		mourir()

	else:
		print (self.name, " Hit_collision par : ", body.name)
		
