extends CanvasLayer

var score

func _ready():
	score=0



func up_score(score):
	score=score+1


#Cette fonction est appelée Mainchaque fois que le score change.
func update_score(score):
	$ScoreLabel.text = str(score)