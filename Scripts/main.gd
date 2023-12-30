extends Node

var collision = false
var game_over = false
var tree

func _ready():
	$Music.play()

func _process(_delta):
	if collision:
		combine_trees()
		collision = false

func combine_trees():
	$game.add_child(tree)
	$PopSound.play()
	
func _on_restart_pressed():
	$ButtonSound.play()
	get_tree().reload_current_scene()

func _on_button_pressed():
	$ButtonSound.play()
	$title_screen.visible = false
	$game.visible = true

func _on_music_finished():
	$Music.play()
