extends KinematicBody2D


# constantes pour les déplacements à la mario
export (int) var speed = 130
export (int) var impulsion= 200
export (int) var delta_bonus= 2
export (int) var bonus= 35
export (int) var gravity_down= 1300
export (int) var max_y= -300
var bonus_y=0
const GRAVITY = 980
#####


# controleur de sons de la princesse
onready var audio_control= get_node("Princesse_Audio")

# noeud principal du jeu
onready var gameNode = get_tree().get_root().find_node("game_2bis",true, false)

#interface
onready var GUI = get_tree().get_root().find_node("GUI",true, false)

# export (int) var speed : int = 150
# export (int) var jump_force = -300



var screen_size : Vector2
 
const FLOOR_NORMAL = Vector2(0,-1)
	
var is_alive= true
# var is_ui_key_jump_release



func _ready():
	add_to_group('princesse')
	self.screen_size = get_viewport_rect().size
	


func get_control_direction():
	"""
	retourne un vecteur (x,y) telque :
	* x =  1 : mouvement à droite
	* x = -1 : mouvement à gauche
	* y =  1 : saute
	
	"""
	var dir:Vector2= Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		dir.x= 1
	if Input.is_action_pressed("ui_left"):
		dir.x= -1
	return dir


var velocity= Vector2()

func set_velocity_x(dir):
	# gestion des vitesses horizontale
	# modification de la vitesse horizontale
	velocity.x  = dir.x * speed


func set_velocity_y(delta):
	# gestion des vitesses verticale (gravitation)
	# vitesse nulle si sur le sol
	if is_on_floor():
		velocity.y= 0
	# gravité plus forte en cas de chute
	var current_gravity= GRAVITY
	if velocity.y > max_y:
		current_gravity= gravity_down
	# application de la gravitation
	velocity.y += current_gravity * delta


# gestion du saut
func start_jumping():
	velocity.y -= impulsion
	bonus_y= bonus

func keep_jumping():
	bonus_y= max(0, bonus_y-delta_bonus)
	velocity.y -= bonus_y

func cut_jumping():
	bonus_y= 0
	velocity.y= max(50, velocity.y)

	
func get_control_jump():
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		start_jumping()
	if Input.is_action_pressed("ui_accept"):
		keep_jumping()
	if Input.is_action_just_released("ui_accept"):
		cut_jumping()


func play_animation(dir):
	if dir.x == 1:
		$AnimatedSprite.play("marche")
		$AnimatedSprite.flip_h = false
	elif dir.x == -1:
		$AnimatedSprite.play("marche")
		$AnimatedSprite.flip_h = true
	elif dir.x == 0:
		$AnimatedSprite.play("idle")
	if velocity.y <0:
		$AnimatedSprite.play("saute")


func mourir():
	is_alive= false
	$AnimatedSprite.play("meurt")
	# attendre la fin de l'animation et quitter
	yield($AnimatedSprite, 'animation_finished')
	if GlobalGame2.princesseVie == 0:
		var _ignore= get_tree().change_scene("res://game2/scenes/game_over.tscn")
	else :
		GlobalGame2.level -= 1
		GlobalGame2.chargeNiveau()		
		


func _physics_process(delta):
	# cas de la chute mortelle
	if velocity.y > 2000:
		mourir()

	if not is_alive:
		return
		
	var direction= get_control_direction()

	set_velocity_x(direction)
	set_velocity_y(delta)
	get_control_jump()
	play_animation(direction)

	var _ignore = move_and_slide(velocity, Vector2(0,-1))


func _on_Corps_body_entered(body):
	if body == self:
		return

	print (self.name, " : contact corps avec ", body.name)
	if 'ennemis' in body.get_groups() and is_alive :
		GlobalGame2.princesseVie -= 1
		print ("Princesse meurt")
		mourir()


func _on_Tete_body_entered(body:Node):
	if body != self:
		print (self.name, " : contact tete avec ", body.name)
		cut_jumping()

