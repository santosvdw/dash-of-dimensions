extends Node2D
# Switching between fullscreen and not fullscreen by pressing esc

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		OS.window_fullscreen = !OS.window_fullscreen


func _on_Player_touch_powerup():
	pass # Replace with function body.
