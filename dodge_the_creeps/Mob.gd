extends RigidBody2D

export (int) var MIN_SPEED # plage de vitesse minimale 
export (int) var MAX_SPEED # plage de vitesse maximale
var mob_types = ["walk", "swim", "fly"]

func _ready():  #hasard l'un des trois types d'animation
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]

func _on_Visibility_screen_exited():
	queue_free()