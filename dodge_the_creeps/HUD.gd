extends CanvasLayer

#Le signal "start_game" indique au nœud "Main" que le bouton a été enfoncé
signal start_game;

#Cette fonction est appelée lorsque nous voulons afficher temporairement un message, tel que "Get Ready".
func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

#Cette fonction est appelée lorsque le joueur perd. Il affichera "Game Over" pendant 2 secondes, puis retournera à l'écran titre et affichera le bouton "Start".
func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$StartButton.show()
	$MessageLabel.text = "Dodge the\nCreeps!"
	$MessageLabel.show()

#Cette fonction est appelée Mainchaque fois que le score change.
func update_score(score):
	$ScoreLabel.text = str(score)





func _on_MessageTimer_timeout():
	$MessageLabel.hide()

func _on_StartButton_pressed():
	$StartButton.hide();
	emit_signal("start_game");	
	
	
