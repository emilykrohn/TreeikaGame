extends RigidBody2D

var can_combine := false

func _on_area_2d_body_entered(body):
	if body.is_in_group("tree8") and can_combine:
		var tree9 = preload("res://Scenes/Game/Trees/tree_9.tscn").instantiate()
		tree9.call_deferred("set_position", position)
		tree9.add_to_group("tree9")
		get_parent().get_parent().tree = tree9
		get_parent().get_parent().collision = true
		body.queue_free()
		queue_free()

func _on_area_2d_area_entered(area):
	if area.name == "combine_area":
		can_combine = true
