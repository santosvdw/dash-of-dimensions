extends Area2D
signal point
var hits = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Point_body_entered(body):
	hide()
	yield(get_tree().create_timer(0.5), "timeout")
	if hits == 0:
		emit_signal("point")
	else:
		pass
	hits = 1
	print('hit')
