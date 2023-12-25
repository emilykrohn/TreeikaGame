extends CharacterBody2D

const SPEED := 10

func _physics_process(_delta):
	$movement.move(SPEED)
	$drop.spawn_tree()
	if Input.is_action_just_pressed("ui_select"):
		$drop.drop_tree()
