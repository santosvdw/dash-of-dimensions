extends CanvasLayer

signal start_game
signal info_screen

func hide_everything() :
	$StartButton.hide()
	$Message.hide()
	$Background.hide()
	$Score.hide()

func show_message(text):
	$Message.text = text
	$Message.show()

func show_points(points):
	if points == 1:
		$Score.text = "Jullie hebben " + str(points) + "\npunt gehaald!"
	else:
		$Score.text = "Jullie hebben " + str(points) + "\npunten gehaald!"
	$Score.show()


func show_game_finished(points):
	$Background.show()
	$StartButton.show()
	show_points(points)
	show_message("Je hebt gewonnen!")

func _on_StartButton_pressed():
	hide_everything()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$Message.hide()


func _on_InfoButton_pressed():
	$StartButton.hide()
	$Score.hide()
	$Message.hide()
	$Background.hide()
	$InfoButton.hide()
	emit_signal("info_screen")
