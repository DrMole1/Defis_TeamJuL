extends Node

export (PackedScene) var Synbole
var score

func _ready():
	randomize()
	$SynboleTimer.start()
	$HUD.update_score(score)



func _on_SynboleTimer_timeout():
	# choisit un emplacement aléatoire sur Path2D 
	$Path2D/PathFollow2D.set_offset(randi())
	# crée une instance de Mob et l'ajoute à la scène
	var synbole = Synbole.instance()
	add_child(synbole)
	# définir la position de la foule à une foule aléatoire 
	synbole.position = $Path2D/PathFollow2D.position