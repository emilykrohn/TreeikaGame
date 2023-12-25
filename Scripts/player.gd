extends CharacterBody2D

const SPEED := 10

func _physics_process(_delta):
	$movement.move(SPEED)
	$drop.spawn_tree()
