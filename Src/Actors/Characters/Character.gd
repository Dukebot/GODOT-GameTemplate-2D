class_name Character
extends KinematicBody2D

onready var movement : TopDownMovementComponent = $TopDownMovementComponent
onready var health : HealthComponent = $HealthComponent


func _on_Hurtbox_hitted(damage):
	health.take_damage(damage)

func _on_HealthComponent_no_health():
	queue_free()
