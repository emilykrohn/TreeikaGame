extends RigidBody2D

var can_combine := false

func _on_area_2d_body_entered(body):
	if body.is_in_group("tree7") and can_combine:
		var tree8 = preload("res://Scenes/Game/Trees/tree_8.tscn").instantiate()
		tree8.call_deferred("set_position", position)
		tree8.add_to_group("tree8")
		get_parent().get_parent().tree = tree8
		get_parent().get_parent().collision = true
		$"../ui/Panel/VBoxContainer/Label2".score += 7
		body.queue_free()
		queue_free()

func _on_area_2d_area_entered(area):
	if area.name == "combine_area":
		can_combine = true
	if area.name == "OutOfBounds":
		$"../../game_over_screen".visible = true
		$"../../game".visible = false
