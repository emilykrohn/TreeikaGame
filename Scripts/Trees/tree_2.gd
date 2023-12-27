extends RigidBody2D

func _on_area_2d_body_entered(body):
	if body.name == "Tree2":
		print("tree2entered")
		var tree3 = preload("res://Scenes/Game/Trees/tree_3.tscn").instantiate()
		tree3.call_deferred("set_position", position)
		get_parent().call_deferred("add_child", tree3)
		queue_free()
