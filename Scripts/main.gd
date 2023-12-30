extends Node

var collision = false
var tree

func _process(_delta):
	if collision:
		combine_trees()
		collision = false

func combine_trees():
	$game.add_child(tree)
	OS.delay_msec(100)
	
func _on_restart_pressed():
	get_tree().reload_current_scene()
