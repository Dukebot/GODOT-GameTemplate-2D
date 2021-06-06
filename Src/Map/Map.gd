class_name Map extends Node2D

onready var characters = find_node("Characters") as YSort

onready var canvas_layer = $CanvasLayer
onready var screen_transition_rect = canvas_layer.find_node("ScreenTransitionRect") as ColorRect
onready var message_box = canvas_layer.find_node("MessageBox") as MessageBox

func _ready():
	#AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	Events.connect("change_scene", self, "_on_change_scene")
	Events.connect("dettach_controls", self, "_on_dettach_controls")
	Events.connect("attach_controls", self, "_on_attach_controls")
	
	for interaction in get_tree().get_nodes_in_group("Interaction"):
		interaction.connect("show_message", message_box, "show_message")
		interaction.connect("hide_message", message_box, "hide_message")


func _on_change_scene(scene_path: String):
	screen_transition_rect.transition_to(scene_path)


func _on_dettach_controls():
	for character in characters.get_children():
		character.set_physics_process(false)


func _on_attach_controls():
	for character in characters.get_children():
		character.set_physics_process(true)
