extends Node

var trees = [preload("res://Scenes/Game/Trees/tree_1.tscn"), preload("res://Scenes/Game/Trees/tree_2.tscn"),
			 preload("res://Scenes/Game/Trees/tree_3.tscn"), preload("res://Scenes/Game/Trees/tree_4.tscn")]

var has_dropped := true
var can_change_tree := false
var is_tree := false
var tree

func spawn_tree():
	if has_dropped:
		tree = trees[randi() % trees.size()].instantiate()
		if tree.name == "Tree1":
			tree.add_to_group("tree1")
			$"../../../../ui/Panel2/VBoxContainer/BoxContainer/TextureRect".texture = load("res://Art/Tree1.png")
		elif tree.name == "Tree2":
			tree.add_to_group("tree2")
			$"../../../../ui/Panel2/VBoxContainer/BoxContainer/TextureRect".texture = load("res://Art/Tree2.png")
		elif tree.name == "Tree3":
			tree.add_to_group("tree3")
			$"../../../../ui/Panel2/VBoxContainer/BoxContainer/TextureRect".texture = load("res://Art/Tree3.png")
		elif tree.name == "Tree4":
			tree.add_to_group("tree4")
			$"../../../../ui/Panel2/VBoxContainer/BoxContainer/TextureRect".texture = load("res://Art/Tree4.png")
		tree.freeze = true
		tree.lock_rotation = true
		tree.global_position = $"../drop_point".global_position
		tree.collision_layer = 2
		$"../../../../".add_child(tree)
		has_dropped = false
		is_tree = true

func move_tree():
	if is_tree:
		tree.global_position = $"../drop_point".global_position

func drop_tree():
	if is_tree:
		tree.collision_layer = 1
		tree.freeze = false
		tree.lock_rotation = false
		can_change_tree = false
		has_dropped = true
		is_tree = false 

func _on_timer_2_timeout():
	can_change_tree = true
