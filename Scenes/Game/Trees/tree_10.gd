extends RigidBody2D

var can_combine := false

func _on_area_2d_body_entered(body):
	if body.is_in_group("tree10") and can_combine:
		var tree11 = preload("res://Scenes/Game/Trees/tree_11.tscn").instantiate()
		tree11.call_deferred("set_position", position)
		tree11.add_to_group("tree11")
		get_parent().get_parent().tree = tree11
		get_parent().get_parent().collision = true
		body.queue_free()
		queue_free()

func _on_area_2d_area_entered(area):
	if area.name == "combine_area":
		can_combine = true
