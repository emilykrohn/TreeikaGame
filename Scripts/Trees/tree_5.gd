extends RigidBody2D

var can_combine := false

func _on_area_2d_body_entered(body):
	if body.is_in_group("tree5") and can_combine:
		var tree6 = preload("res://Scenes/Game/Trees/tree_6.tscn").instantiate()
		tree6.call_deferred("set_global_position", global_position)
		tree6.add_to_group("tree6")
		get_parent().get_parent().tree = tree6
		get_parent().get_parent().count += 1
		body.queue_free()
		queue_free()

func _on_area_2d_area_entered(area):
	if area.name == "combine_area":
		can_combine = true
