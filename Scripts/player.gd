extends CharacterBody2D

const SPEED := 10
var can_move := false
var can_drop := true
var can_spawn := true
var spawned := false

func _physics_process(_delta):
	if not spawned and can_spawn:
		$drop.spawn_tree()
		spawned = true
		can_spawn = false
	if spawned:
		$drop.move_tree()
	if spawned and can_drop and Input.is_action_just_pressed("ui_select"):
		can_move = false
		can_drop = false
		spawned = false
		$drop.drop_tree()
	if can_move:
		$movement.move(SPEED)
		if $movement.is_moving:
			$animation.walk()
	if not $movement.is_moving:
		$animation.idle()

func _on_move_cooldown_timeout():
	can_move = true
	
func _on_input_cooldown_timeout():
	can_drop = true

func _on_spawn_cooldown_timeout():
	can_spawn = true
