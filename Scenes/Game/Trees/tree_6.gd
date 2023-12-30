extends RigidBody2D

var can_combine := false

func _on_area_2d_body_entered(body):
	if body.is_in_group("tree6") and can_combine:
		var tree7 = preload("res://Scenes/Game/Trees/tree_7.tscn").instantiate()
		tree7.call_deferred("set_position", position)
		tree7.add_to_group("tree7")
		get_parent().get_parent().tree = tree7
		get_parent().get_parent().collision = true
		body.queue_free()
		queue_free()

func _on_area_2d_area_entered(area):
	if area.name == "combine_area":
		can_combine = true
	if area.name == "OutOfBounds":
		print("GameOver")
