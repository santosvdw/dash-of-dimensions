extends Node2D
var score = 0
# Switching between fullscreen and not fullscreen by pressing esc

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		OS.window_fullscreen = !OS.window_fullscreen

func _ready():
	$ScoreLayer/ScoreLabel.hide()

func new_game():
	score = 0
	$ScoreLayer/ScoreLabel.text = "0"
	$HUD_info.hide()
	$HUD_info.hide()
	$Player.position.x = -1536
	$Player.position.y = 704
	$Player2.position.x = -1510
	$Player2.position.y = 704
	$ScoreLayer/ScoreLabel.show()
	$EndPoint.new_game()

func game_finished():
	$ScoreLayer/ScoreLabel.hide()
	$HUD_end.show()

func info_screen():
	$ScoreLayer/ScoreLabel.hide()
	$HUD_info.show()

func extra_point():
	score = score + 1
	$ScoreLayer/ScoreLabel.text = str(score)
	print(str(score))
