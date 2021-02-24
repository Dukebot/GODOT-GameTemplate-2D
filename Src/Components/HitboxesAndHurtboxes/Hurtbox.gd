extends Area2D

signal hitted(damage)

func _on_Hurtbox_area_entered(hitbox):
	emit_signal("hitted", hitbox.damage)
