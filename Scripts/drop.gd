extends Node

var trees = [preload("res://Scenes/Game/Trees/tree_1.tscn"), preload("res://Scenes/Game/Trees/tree_2.tscn"),
			 preload("res://Scenes/Game/Trees/tree_3.tscn"), preload("res://Scenes/Game/Trees/tree_4.tscn")]

var has_dropped := true
var can_change_tree := false
var is_tree := false
var current_tree = trees[randi() % trees.size()].instantiate()
var next_tree

func spawn_tree():
	if has_dropped:
		next_tree = trees[randi() % trees.size()].instantiate()

		if current_tree.name == "Tree1":
			current_tree.add_to_group("tree1")
		elif current_tree.name == "Tree2":
			current_tree.add_to_group("tree2")
		elif current_tree.name == "Tree3":
			current_tree.add_to_group("tree3")
		elif current_tree.name == "Tree4":
			current_tree.add_to_group("tree4")

		if next_tree.name == "Tree1":
			$"../../../../ui/Panel2/VBoxContainer/BoxContainer/TextureRect".texture = load("res://Art/Tree1.png")
		elif next_tree.name == "Tree2":
			$"../../../../ui/Panel2/VBoxContainer/BoxContainer/TextureRect".texture = load("res://Art/Tree2.png")
		elif next_tree.name == "Tree3":
			$"../../../../ui/Panel2/VBoxContainer/BoxContainer/TextureRect".texture = load("res://Art/Tree3.png")
		elif next_tree.name == "Tree4":
			$"../../../../ui/Panel2/VBoxContainer/BoxContainer/TextureRect".texture = load("res://Art/Tree4.png")
			
		current_tree.freeze = true
		current_tree.lock_rotation = true
		current_tree.global_position = $"../drop_point".global_position
		current_tree.collision_layer = 2
		$"../../../../".add_child(current_tree)
		has_dropped = false
		is_tree = true

func move_tree():
	if is_tree:
		current_tree.global_position = $"../drop_point".global_position

func drop_tree():
	if is_tree:
		current_tree.collision_layer = 1
		current_tree.freeze = false
		current_tree.lock_rotation = false
		can_change_tree = false
		has_dropped = true
		is_tree = false
		current_tree = next_tree

func _on_timer_2_timeout():
	can_change_tree = true
