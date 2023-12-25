extends CharacterBody2D

const SPEED := 10
var can_move := true
var can_drop := true

func _physics_process(_delta):
	$drop.spawn_tree()
	if can_drop and Input.is_action_just_pressed("ui_select"):
		can_move = false
		can_drop = false
		$drop.drop_tree()
	if can_move:
		$movement.move(SPEED)

func _on_move_cooldown_timeout():
	can_move = true
	
func _on_input_cooldown_timeout():
	can_drop = true
