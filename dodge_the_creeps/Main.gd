extends Node

export (PackedScene) var Mob
var score

func _ready():
	randomize()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Music.play()
	
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()

func _on_MobTimer_timeout():
	# choisit un emplacement aléatoire sur Path2D 
	$MobPath/MobSpawnLocation.set_offset(randi())
	# crée une instance de Mob et l'ajoute à la scène
	var mob = Mob.instance()
	add_child(mob)
	# positionne la direction de la foule perpendiculairement à la direction du chemin
	var direction = $MobPath/MobSpawnLocation.rotation + PI/2
	# définir la position de la foule à une foule aléatoire 
	mob.position = $MobPath/MobSpawnLocation.position
	# ajouter un peu de hasard à la direction
	direction += rand_range(-PI/4, PI/4)
	mob.rotation = direction
	# choisissez la vélocité
	mob.set_linear_velocity(Vector2(rand_range(mob.MIN_SPEED, mob.MAX_SPEED), 0).rotated(direction))


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)