extends CharacterBody2D

const SPEED := 10

func _physics_process(_delta):
	$Movement.move(SPEED)
