extends CharacterBody2D

const SPEED := 10
var can_move = true

func _physics_process(_delta):
	$drop.spawn_tree()
	if Input.is_action_just_pressed("ui_select"):
		can_move = false
		$drop.drop_tree()
	if can_move:
		$movement.move(SPEED)

func _on_move_cooldown_timeout():
	can_move = true
