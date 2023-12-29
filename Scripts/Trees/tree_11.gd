extends RigidBody2D

var can_combine := false

func _on_area_2d_body_entered(body):
	if body.name == "Tree1" and can_combine:
		body.queue_free()
		queue_free()

func _on_area_2d_area_entered(area):
	if area.name == "combine_area":
		can_combine = true
