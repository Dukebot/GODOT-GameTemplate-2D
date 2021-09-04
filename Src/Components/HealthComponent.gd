class_name HealthComponent extends Node

signal damaged
signal no_health

export var max_health: float = 100
export var take_damage_cooldown: float = 1

var health = max_health
var take_damage_invincibility := false

onready var take_damage_timer = $TakeDamageTimer

func take_damage(amount: float):
	if not take_damage_invincibility:
		take_damage_invincibility = true
		emit_signal("damaged")
		health -= amount
		if health <= 0:
			emit_signal("no_health")
		take_damage_timer.start(take_damage_cooldown)

func _on_TakeDamageTimer_timeout():
	take_damage_invincibility = false
