extends Node2D
var score
# Switching between fullscreen and not fullscreen by pressing esc

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		OS.window_fullscreen = !OS.window_fullscreen

func new_game():
	score = 0
	$ScoreTimer.start()
	$HUD_info.hide()

func game_over():
	$ScoreTimer.stop()
	$HUD_end.show_game_finished()

func info_screen():
	$HUD_info.show()
