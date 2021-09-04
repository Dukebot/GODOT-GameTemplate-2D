class_name MessageBox extends ColorRect

onready var label = find_node("Label")


func _ready():
	visible = false
	
	for dialogue_component in get_tree().get_nodes_in_group("dialogue_component"):
		dialogue_component.connect("dialogue_ended", self, "hide_message")
		dialogue_component.connect("show_dialogue_text", self, "show_message")


func show_message(_speaker_name: String, message: String):
	visible = true
	label.text = message


func hide_message():
	visible = false
