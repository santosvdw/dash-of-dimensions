extends CanvasLayer

signal start_game
signal info_screen

#func update_score(score):
#	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	$Background.hide()
	$Description.hide()
	$Title.hide()
	$Controls.hide()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$Message.hide()


func _on_InfoButton_pressed():
	$StartButton.hide()
	$Background.hide()
	$InfoButton.hide()
	emit_signal("info_screen")
