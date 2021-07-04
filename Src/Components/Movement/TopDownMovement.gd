class_name TopDownMovement extends Node

export var acceleration: float = 2000
export var friction: float = 2000
export var max_speed: float = 300

var linear_velocity: Vector2 = Vector2()

onready var kinematic_body: KinematicBody2D = get_parent()


func move(direction: Vector2, delta: float):
	if direction != Vector2.ZERO:
		linear_velocity = linear_velocity.move_toward(direction * max_speed, acceleration * delta)
	else:
		linear_velocity = linear_velocity.move_toward(Vector2.ZERO, friction * delta)
	linear_velocity = kinematic_body.move_and_slide(linear_velocity)
