extends KinematicBody2D

export (int) var speed : int = 200
export (int) var gravity = -200
export (int) var start_jump = -200
export (int) var max_jump = 50
var jump= 0

var screen_size : Vector2
 
	
var state = IDLE
enum {IDLE,MARCHE,SAUTE, SAUTE_UP, SAUTE_DOWN}


 
func _ready():
	self.screen_size = get_viewport_rect().size
	state = IDLE
	print ("IDLE")
	self.jump= 0


var velocity= Vector2()
func _physics_process(delta):
	
	# print ("état : ", state)
	# var joystick_seuil = 0.5
	# var joystick_value = joystick.get_value()

	var direction =Vector2(0,0)
	if Input.is_action_pressed("ui_right") :
		$AnimatedSprite.flip_h = false
		direction.x = speed
		# if state != SAUTE_UP or state != SAUTE_DOWN:
			# state = MARCHE
			# print ("MARCHE")
	if Input.is_action_pressed("ui_left") :
		$AnimatedSprite.flip_h = true
		direction.x = -speed
		# if state != SAUTE_UP or state != SAUTE_DOWN:
			# state = MARCHE
			# print ("MARCHE")
	
	if direction.length() > 0:
		direction= direction.normalized() * self.speed * delta

	velocity.x = direction.x * self.speed



	velocity.y += -self.gravity * delta

	if Input.is_action_pressed("ui_accept"):
		if state == IDLE or state == MARCHE :
			self.jump= 20
			state = SAUTE_UP
			velocity.y = self.start_jump#-min (self.jump, self.max_jump)
		elif state == SAUTE_UP:
			print (self.jump)			
			self.jump += 1
			velocity.y += -self.jump
		
	if self.jump > max_jump or velocity.y >= 0:
			state = SAUTE_DOWN


	if direction.x != 0:
		# state = MARCHE
		# audio_pas.stream_paused = false
		$AnimatedSprite.play("marche")
	elif state == SAUTE_UP or state == SAUTE_DOWN:
		$AnimatedSprite.play("saute")
	else:
		state = IDLE
		# audio_pas.stream_paused = true
		$AnimatedSprite.play("idle")



	var _ignore = move_and_slide(velocity, Vector2(0,1))



	for i in get_slide_count():
		var collision = get_slide_collision(i)
		# print("collision avec ", collision.collider.name)
		velocity.y= 0
		if state != MARCHE:
			state = IDLE
		# print ("IDLE")



func _on_Corps_body_shape_entered(body_id:int, body:Node, body_shape:int, area_shape:int):
	if body != self:
		print ("contact avec ", body.name)
		mourir()


func mourir():
	print ("Princesse meurt")
