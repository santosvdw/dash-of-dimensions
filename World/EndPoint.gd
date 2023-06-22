extends Area2D
signal hit
signal game_finished
var hits = 0

func new_game():
	$AnimatedSprite.animation = $AnimatedSprite.frames.get_animation_names()[0]
	position.x = 932
	position.y = 21
	$AnimatedSprite.playing = true
	if $AnimatedSprite.frame == 0:
		$AnimatedSprite.playing = false
	hits = 0

func _ready():
	new_game()

func check_hits(hits):
	if hits == 0: # Verander animatieframe naar halve ster en verander locatie
		$AnimatedSprite.animation = $AnimatedSprite.frames.get_animation_names()[0]
		$AnimatedSprite.playing = true
		position.x = -949
		position.y = -343
		if $AnimatedSprite.frame == 1:
			$AnimatedSprite.playing = false
	elif hits == 1: # Speel 3 seconden een win animatie af en verstuur daarna signaal
		$AnimatedSprite.animation = $AnimatedSprite.frames.get_animation_names()[1]
		$AnimatedSprite.playing = true
		yield(get_tree().create_timer(3), "timeout")
		emit_signal("game_finished")
	elif hits > 2: # Doe niks
		pass


func _on_EndPoint_body_entered(body):
	if hits < 2: # Verander animatieframe, verstuur signaal, check hits, verhoog hits
		$AnimatedSprite.animation = $AnimatedSprite.frames.get_animation_names()[0]
		emit_signal("hit")
		check_hits(hits)
		hits = hits + 1
	return # Als het meer dan 2x is aangeraakt doe niks
