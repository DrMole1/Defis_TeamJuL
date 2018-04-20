extends Area2D

signal hit

export (int) var SPEED  # vitesse de déplacement du joueur (pixels / sec) 
var velocity = Vector2()  # le vecteur de mouvement du joueur
var screensize  # taille de la fenêtre de jeu

func _ready():
	screensize = get_viewport_rect().size
	hide()

func _process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0

func _on_Player_body_entered( body ):
	hide() # Le joueur disparaît après avoir été frappé 
	emit_signal("hit")
	$CollisionShape2D.disabled = true

func start(pos):  #réinitialiser le joueur lors du démarrage d'une nouvelle partie
	position = pos
	show()
	$CollisionShape2D.disabled = false
