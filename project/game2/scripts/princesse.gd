extends KinematicBody2D


# controleur de sons de la princesse
onready var audio_control= get_node("Princesse_Audio")


export (int) var speed : int = 150
export (int) var jump_force = -300


var screen_size : Vector2
 
const FLOOR_NORMAL = Vector2(0,-1)
const GRAVITY = 980
	
var is_alive
var is_ui_key_jump_release

var points = 0
var vie = 3

func _ready():
	is_ui_key_jump_release= true
	is_alive = true
	self.screen_size = get_viewport_rect().size


var velocity= Vector2()


func gravity(delta):

	if is_on_floor():
		
		velocity.y = 0

	else :
		velocity.y += GRAVITY * delta
		


func jump():
	if is_ui_key_jump_release and is_on_floor() and (Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_accept")):
		audio_control.play_jump()
		is_ui_key_jump_release= false
		velocity.y = jump_force
		

	if velocity.y < 0:
		# print(velocity.y)
		$AnimatedSprite.play("saute")

func walk():

	if Input.is_action_pressed("ui_left") :
		# print("marche G")
		$AnimatedSprite.play("marche")
		$AnimatedSprite.flip_h = true
		velocity.x = -speed

	elif Input.is_action_pressed("ui_right") :
		# print("marche Droite")
		$AnimatedSprite.play("marche")
		$AnimatedSprite.flip_h = false
		velocity.x = speed

	
	else :
		$AnimatedSprite.play("idle")
		velocity.x = 0


func _physics_process(delta):
	if not is_alive:
		return

	gravity(delta)
	walk()

	if Input.is_action_just_released("ui_accept"):
		is_ui_key_jump_release= true

	jump()
	var _ignore = move_and_slide(velocity, FLOOR_NORMAL)



func _on_Corps_body_entered(body):
	if body == self:
		return

	print (self.name, " : contact corps avec ", body.name)
	
	if 'ennemis' in body.get_groups():
		mourir()


func mourir():
	is_alive= false
	$AnimatedSprite.play("meurt")
	# print ("Princesse meurt")
	# attendre la fin de l'animation et quitter
	yield($AnimatedSprite, 'animation_finished')
	var _ignore= get_tree().change_scene("res://game2/scenes/game_over.tscn")


func _on_Tete_body_entered(body:Node):
	if body != self:
		print (self.name, " : contact pied avec ", body.name)

