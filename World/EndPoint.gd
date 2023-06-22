extends Area2D
signal hit
signal game_finished
var hits = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = $AnimatedSprite.frames.get_animation_names()[0]
	position.x = 932
	position.y = 21


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func check_hits(hits):
	if hits == 0:
		$AnimatedSprite.animation = $AnimatedSprite.frames.get_animation_names()[0]
		print('hits is 0')
		print(hits)
		$AnimatedSprite.playing = true
		position.x = -949
		position.y = -343
		if $AnimatedSprite.frame == 1:
			$AnimatedSprite.playing = false
	elif hits == 1:
		$AnimatedSprite.animation = $AnimatedSprite.frames.get_animation_names()[1]
		$AnimatedSprite.playing = true
		yield(get_tree().create_timer(3), "timeout")
		emit_signal("game_finished")
	elif hits > 2:
		pass


func _on_EndPoint_body_entered(body):
	$AnimatedSprite.animation = $AnimatedSprite.frames.get_animation_names()[0]
	emit_signal("hit")
	check_hits(hits)
	hits = hits + 1
	

# var mob_types = $AnimatedSprite.frames.get_animation_names()
# $AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
