class_name Interaction extends Node2D

signal show_message(message)
signal hide_message()

export (String) var message := ""
var message_shown := false


func _ready():
	add_to_group("Interaction")


func _on_InteractionArea_interacted(interactor):
	if not message_shown:
		emit_signal("show_message", message)
		message_shown = true
	else:
		emit_signal("hide_message")
		message_shown = false


func _on_InteractionArea_undetected():
	emit_signal("hide_message")
	message_shown = false
