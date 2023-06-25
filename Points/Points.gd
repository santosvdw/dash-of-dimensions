extends Area2D
signal point
var hits = 0

func new_game():
	show()
	hits = 0

func _ready():
	new_game()
	

func _on_Point_body_entered(body):
	hide()
	yield(get_tree().create_timer(0.1), "timeout")
	if hits == 0:
		emit_signal("point")
	else:
		pass
	hits = 1
	print('hit')
