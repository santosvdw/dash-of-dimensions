extends CanvasLayer

signal start_game
signal info_screen

#func update_score(score):
#	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	$Background.hide()
	$GoBackButton.hide()
	$ScoreLabel.show()
	$Description.hide()
	$Title.hide()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$Message.hide()


func _on_InfoButton_pressed():
	$StartButton.hide()
	$Background.hide()
	$InfoButton.hide()
	$ScoreLabel.hide()
	emit_signal("info_screen")
