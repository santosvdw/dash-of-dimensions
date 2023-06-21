extends Area2D
signal hit
var score = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = $AnimatedSprite.frames.get_animation_names()[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func check_score(score):
	if score == 0:
		$AnimatedSprite.animation = $AnimatedSprite.frames.get_animation_names()[0]
		print('score is 0')
		print(score)
		$AnimatedSprite.playing = true
		if $AnimatedSprite.frame == 1:
			$AnimatedSprite.playing = false
	elif score == 1:
		$AnimatedSprite.animation = $AnimatedSprite.frames.get_animation_names()[1]
		$AnimatedSprite.playing = true
	elif score > 2:
		$AnimatedSprite.animation = $AnimatedSprite.frames.get_animation_names()[1]
		$AnimatedSprite.playing = true
		


func _on_EndPoint_body_entered(body):
	$AnimatedSprite.animation = $AnimatedSprite.frames.get_animation_names()[0]
	emit_signal("hit")
	check_score(score)
	score = score + 1

# var mob_types = $AnimatedSprite.frames.get_animation_names()
# $AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
