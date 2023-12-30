extends Node

var count := 0
var tree

func _process(_delta):
	if count == 2:
		combine_trees()
		count = 0

func combine_trees():
	$game.add_child(tree)
