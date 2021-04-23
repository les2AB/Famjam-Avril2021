extends KinematicBody2D

export (int) var speed : int = 200
export (int) var jump_force = -300


var screen_size : Vector2
 
const FLOOR_NORMAL = Vector2(0,-1)
const GRAVITY = 980
	
 
func _ready():
	self.screen_size = get_viewport_rect().size


var velocity= Vector2()


func gravity(delta):

	if is_on_floor():
		
		velocity.y = 0

	else :
		velocity.y += GRAVITY * delta
		


func jump():

	if is_on_floor() and Input.is_action_pressed("ui_up"):
		velocity.y = jump_force
		

	if velocity.y < 0:
		print(velocity.y)
		$AnimatedSprite.play("saute")

func walk():

	if Input.is_action_pressed("ui_left") :
		print("marche G")
		$AnimatedSprite.play("marche")
		$AnimatedSprite.flip_h = true
		velocity.x = -speed

	elif Input.is_action_pressed("ui_right") :
		print("marche Droite")
		$AnimatedSprite.play("marche")
		$AnimatedSprite.flip_h = false
		velocity.x = speed

	
	else :
		$AnimatedSprite.play("idle")
		velocity.x = 0


func _physics_process(delta):
	gravity(delta)
	walk()
	jump()
	move_and_slide(velocity, FLOOR_NORMAL)


func _on_Corps_body_entered(body):
	if body != self:
		print ("contact avec ", body.name)
		mourir()


func mourir():
	$AnimatedSprite.play("meurt")
	print ("Princesse meurt")


func _on_Tete_body_entered(body:Node):
	pass