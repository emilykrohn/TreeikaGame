extends Node

var trees = [preload("res://Scenes/Game/Trees/tree_1.tscn"), preload("res://Scenes/Game/Trees/tree_2.tscn"),
			 preload("res://Scenes/Game/Trees/tree_3.tscn"), preload("res://Scenes/Game/Trees/tree_4.tscn")]

var spawn_cooldown := true

func spawn_tree():
	if spawn_cooldown and Input.is_action_just_pressed("ui_select"):
		var tree = trees[randi() % trees.size()].instantiate()
		tree.global_position = $"../drop_point".global_position
		$"../../../../".add_child(tree)
		spawn_cooldown = false

func _on_timer_timeout():
	spawn_cooldown = true
