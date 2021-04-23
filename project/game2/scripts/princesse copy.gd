extends KinematicBody2D

# export (int) var speed : int = 200
# export (int) var gravity = -200
# export (int) var start_jump = -200
# export (int) var max_jump = 50
# var jump= 0

var screen_size : Vector2
 
const FLOOR_NORMAL = Vector2(0,-1)
const GRAVITY = 980
const SPEED = 200
const JUMP_FORCE = -600
	
# var state = IDLE
# enum {IDLE,MARCHE,SAUTE, SAUTE_UP, SAUTE_DOWN}


 
func _ready():
	self.screen_size = get_viewport_rect().size
	# state = IDLE
	# print ("IDLE")
	# self.jump= 0


var velocity= Vector2()


func gravity(delta):

	if is_on_floor():
		
		velocity.y = 0

	else :
		velocity.y += GRAVITY * delta
		


func jump():

	if is_on_floor() and Input.is_action_pressed("ui_up"):
		velocity.y = JUMP_FORCE
		

	if velocity.y < 0:
		print(velocity.y)
		$AnimatedSprite.play("saute")

func walk():

	if Input.is_action_pressed("ui_left") :
		print("marche G")
		$AnimatedSprite.play("marche")
		$AnimatedSprite.flip_h = true
		velocity.x = -SPEED

	elif Input.is_action_pressed("ui_right") :
		print("marche Droite")
		$AnimatedSprite.play("marche")
		$AnimatedSprite.flip_h = false
		velocity.x = SPEED

	

	else :
		$AnimatedSprite.play("idle")
		velocity.x = 0


func _physics_process(delta):
	gravity(delta)
	walk()
	jump()
	move_and_slide(velocity, FLOOR_NORMAL)

	# var direction =Vector2(0,0)
	# if Input.is_action_pressed("ui_right") :
	# 	$AnimatedSprite.flip_h = false
	# 	direction.x = speed
	# if Input.is_action_pressed("ui_left") :
	# 	$AnimatedSprite.flip_h = true
	# 	direction.x = -speed
	
	# if direction.length() > 0:
	# 	direction= direction.normalized() * self.speed * delta

	# 	if state != SAUTE_DOWN or state!=SAUTE_UP:
	# 		state = MARCHE

	# velocity.x = direction.x * self.speed
	# velocity.y += -self.gravity * delta 

	# if Input.is_action_pressed("ui_accept"):
	# 	if state != SAUTE_DOWN or state!= SAUTE_UP:
	# 		if state == IDLE or state == MARCHE :
	# 			self.jump= 20
	# 			state = SAUTE_UP
	# 			print ("SAUTE_UP")
	# 			velocity.y = self.start_jump
	# 		elif state == SAUTE_UP:
	# 			self.jump += 1
	# 			velocity.y += -self.jump
	# 			if self.jump > max_jump or velocity.y >= 0:
	# 				print ("SAUTE_DOWN")
	# 				state = SAUTE_DOWN
	 

	# if state == MARCHE:
	# 	# print ("MARCHE")
	# 	$AnimatedSprite.play("marche")
	# elif state == SAUTE_UP:
	# 	# print ("SAUTE_UP")
	# 	$AnimatedSprite.play("saute")
	# elif state == SAUTE_DOWN:
	# 	print ("SAUTE_DOWN")
	# 	$AnimatedSprite.play("saute")
	# else:
	# 	# print ("IDLE")
	# 	$AnimatedSprite.play("idle")



	# var _ignore = move_and_slide(velocity, Vector2(0,1))



	# for i in get_slide_count():
	# 	var collision = get_slide_collision(i)
	# 	# print("collision avec ", collision.collider.name)
	# 	velocity.y= 0
	# 	if state != MARCHE:
	# 		state = IDLE
	# 		print ("IDLE")



func _on_Corps_body_shape_entered(_body_id:int, body:Node, _body_shape:int, _area_shape:int):
	if body != self:
		print ("contact avec ", body.name)
		mourir()


func mourir():
	print ("Princesse meurt")


# func _on_Pieds_body_entered(body:Node):
# 	if body != self:
# 		state = IDLE
# 		print("atterrissage")