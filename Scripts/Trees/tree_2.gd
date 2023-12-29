extends RigidBody2D

var can_combine := false

func _on_area_2d_body_entered(body):
	if body.name == "Tree2" and can_combine:
		var tree3 = preload("res://Scenes/Game/Trees/tree_3.tscn").instantiate()
		tree3.call_deferred("set_position", position)
		get_parent().call_deferred("add_child", tree3)
		body.queue_free()
		queue_free()

func _on_area_2d_area_entered(area):
	if area.name == "combine_area":
		can_combine = true
