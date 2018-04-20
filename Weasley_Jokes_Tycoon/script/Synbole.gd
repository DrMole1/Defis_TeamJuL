extends RigidBody2D


signal hit

func _ready():
	pass


func _on_Button_pressed():
	hide()
	emit_signal("hit")