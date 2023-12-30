extends RigidBody2D

var can_combine := false

func _on_area_2d_body_entered(body):
	if body.is_in_group("tree11") and can_combine:
		$"../ui/Panel/VBoxContainer/Label2".score += 11
		body.queue_free()
		queue_free()

func _on_area_2d_area_entered(area):
	if area.name == "combine_area":
		can_combine = true
	if area.name == "OutOfBounds":
		$"../../game_over_screen".visible = true
		$"../../game".visible = false
