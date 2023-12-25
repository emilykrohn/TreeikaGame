extends Node

@onready var sprite = $%AnimatedSprite2D

func idle():
	sprite.play("idle")

func walk():
	sprite.play("walk")
