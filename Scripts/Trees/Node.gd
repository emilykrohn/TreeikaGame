extends Node

var can_combine := false

func _on_area_2d_body_entered(body):
	if body.name == "Tree1" and can_combine:
		print("tree1")
		var tree2 = preload("res://Scenes/Game/Trees/tree_2.tscn").instantiate()
		tree2.call_deferred("set_position", get_parent().position)
		get_parent().call_deferred("add_child", tree2)
		body.queue_free()
		queue_free()

func _on_area_2d_area_entered(area):
	if area.name == "combine_area":
		can_combine = true
