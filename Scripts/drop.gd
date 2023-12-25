extends Node

var trees = [preload("res://Scenes/Game/Trees/tree_1.tscn"), preload("res://Scenes/Game/Trees/tree_2.tscn"),
			 preload("res://Scenes/Game/Trees/tree_3.tscn"), preload("res://Scenes/Game/Trees/tree_4.tscn")]

var spawn_cooldown := true
var has_dropped := true
var tree

func spawn_tree():
	if spawn_cooldown and has_dropped:
		tree = trees[randi() % trees.size()].instantiate()
		tree.freeze = true
		tree.lock_rotation = true
		tree.global_position = $"../drop_point".global_position
		tree.collision_layer = 2
		$"../../../../".add_child(tree)
		spawn_cooldown = false
		has_dropped = false
	else:
		tree.global_position = $"../drop_point".global_position

func drop_tree():
	tree.collision_layer = 1
	tree.freeze = false
	tree.lock_rotation = false
	has_dropped = true

func _on_timer_timeout():
	spawn_cooldown = true
