class_name Character
extends KinematicBody2D

onready var movement : TopDownMovementComponent = $TopDownMovementComponent
onready var health : HealthComponent = $HealthComponent


func _on_Hurtbox_area_entered(area):
	health.take_damage(area.damage)

func _on_HealthComponent_no_health():
	queue_free()
