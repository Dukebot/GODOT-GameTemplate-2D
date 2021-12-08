class_name MessageBox extends ColorRect

signal text_animation_ended

export var text_animation_speed: float = 50

onready var label = find_node("Label")


func _ready():
	visible = false
	set_process(false)
	
	for dialogue_component in get_tree().get_nodes_in_group("dialogue_component"):
		dialogue_component.connect("dialogue_ended", self, "hide_message")
		dialogue_component.connect("show_dialogue_text", self, "show_message")
		dialogue_component.connect("end_text_animation", self, "end_text_animation")
		self.connect("text_animation_ended", dialogue_component, "_on_text_animation_ended")


func _process(delta):
	label.percent_visible += delta * text_animation_speed / label.text.length()
	if label.percent_visible >= 1:
		end_text_animation()


func show_message(_speaker_name: String, message: String):
	visible = true
	set_process(true)
	label.text = message
	label.percent_visible = 0


func hide_message():
	visible = false
	set_process(false)


func end_text_animation():
	set_process(false)
	label.percent_visible = 1
	emit_signal("text_animation_ended")
