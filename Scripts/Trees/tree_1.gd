extends RigidBody2D

var can_combine := false

func _on_area_2d_body_entered(body):
	if body.is_in_group("tree1") and can_combine:
		var tree2 = preload("res://Scenes/Game/Trees/tree_2.tscn").instantiate()
		tree2.call_deferred("set_position", position)
		tree2.add_to_group("tree1")
		get_parent().get_parent().tree = tree2
		get_parent().get_parent().count += 1
		body.queue_free()
		queue_free()

func _on_area_2d_area_entered(area):
	if area.name == "combine_area":
		can_combine = true
