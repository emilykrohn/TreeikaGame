extends Node

var is_moving := false
var previous_movement

func move(SPEED):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		$"../../".progress_ratio += direction * 0.001 * SPEED
		is_moving = true
	else:
		is_moving = false
