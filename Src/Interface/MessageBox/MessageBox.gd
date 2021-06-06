class_name MessageBox extends ColorRect

onready var label = find_node("Label")


func _ready():
	visible = false


func show_message(message: String):
	visible = true
	label.text = message


func hide_message():
	visible = false
