extends CanvasLayer

signal start_game
signal info_screen

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_finished():
	show_message("Je hebt gewonnen!")
	# Wait until the MessageTimer has counted down.
	yield($MessageTimer, "timeout")

	$Message.text = "Dash of Dimensions"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()

#func update_score(score):
#	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	$Message.hide()
	$Background.hide()
	$InfoButton.hide()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$Message.hide()


func _on_InfoButton_pressed():
	$StartButton.hide()
	$Message.hide()
	$Background.hide()
	$InfoButton.hide()
	emit_signal("info_screen")
