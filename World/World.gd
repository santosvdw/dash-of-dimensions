extends Node2D
var score = 0
# Switching between fullscreen and not fullscreen by pressing esc

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		OS.window_fullscreen = !OS.window_fullscreen

func new_game():
	score = 0
	$ScoreTimer.start()
	$HUD_info.hide()
	$HUD_info.hide()
	$Player.position.x = -1536
	$Player.position.y = 704
	$Player2.position.x = -1510
	$Player2.position.y = 704

func game_finished():
	$ScoreTimer.stop()
	$HUD_end.show()

func info_screen():
	$HUD_info.show()

func extra_point():
	score = score + 1
	print(str(score))
