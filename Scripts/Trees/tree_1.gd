extends RigidBody2D

func _on_area_2d_body_entered(body):
	if body.name == "Tree1":
		print("tree1entered")
		var tree2 = preload("res://Scenes/Game/Trees/tree_2.tscn").instantiate()
		tree2.call_deferred("set_position", position)
		get_parent().call_deferred("add_child", tree2)
		queue_free()
