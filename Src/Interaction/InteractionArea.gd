class_name InteractionArea extends Area2D

signal interacted(interactor)
signal detected()
signal undetected()


func interact(interactor):
	emit_signal("interacted", interactor)


func detected():
	emit_signal("detected")


func undetected():
	emit_signal("undetected")
