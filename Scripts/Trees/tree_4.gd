extends RigidBody2D

var can_combine := false

func _on_area_2d_body_entered(body):
	if body.is_in_group("tree4") and can_combine:
		var tree5 = preload("res://Scenes/Game/Trees/tree_5.tscn").instantiate()
		tree5.call_deferred("set_global_position", global_position)
		tree5.add_to_group("tree5")
		get_parent().get_parent().tree = tree5
		get_parent().get_parent().collision = true
		$"../ui/Panel/VBoxContainer/Label2".score += 4
		body.queue_free()
		queue_free()

func _on_area_2d_area_entered(area):
	if area.name == "combine_area":
		can_combine = true
	if area.name == "OutOfBounds":
		$"../../game_over_screen".visible = true
		$"../../game".visible = false
