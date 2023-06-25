extends Node2D
signal switch_to_right
signal switch_to_left

var position_players = "left"
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
	$Points/Point1.show()
	$Points/Point2.show()
	$Points/Point3.show()
	$Points/Point4.show()
	$Points/Point5.show()
	$Points/Point6.show()
	$Points/Point7.show()
	$Points/Point8.show()
	$Points/Point9.show()
	$Points/Point10.show()
	$Points/Point11.show()
	$Points/Point12.show()

func game_finished():
	$ScoreLayer/ScoreLabel.hide()
	$HUD_end.show()
	$HUD_end.show_game_finished(score)

func info_screen():
	$ScoreLayer/ScoreLabel.hide()
	$HUD_info.show()

func extra_point():
	score = score + 1
	$ScoreLayer/ScoreLabel.text = str(score)
	print(str(score))


func _on_SwitchRight_body_entered(body):
	if position_players == "right":
		$Player.position.x = -100
		$Player.position.y = 100
		$Player2.position.x = -90
		$Player2.position.y = 100
		yield(get_tree().create_timer(0.5), "timeout")
		position_players = "left"


func _on_Left_body_entered(body):
	if position_players == "left":
		$Player.position.x = 60
		$Player.position.y = 100
		$Player2.position.x = 50
		$Player2.position.y = 100
		yield(get_tree().create_timer(0.3), "timeout")
		position_players = "right"
