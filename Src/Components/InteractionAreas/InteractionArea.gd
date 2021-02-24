class_name InteractionArea
extends Area2D

signal interacted(interactor)

func interact(interactor):
	emit_signal("interacted", interactor)
