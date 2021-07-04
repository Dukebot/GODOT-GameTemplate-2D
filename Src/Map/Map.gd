class_name Map extends Node2D

onready var y_sort: YSort = get_node("YSort")
onready var characters: YSort = y_sort.find_node("Characters")

onready var canvas_layer: CanvasLayer = get_node("CanvasLayer")
onready var screen_transition_rect: ScreenTransitionRect = canvas_layer.find_node("ScreenTransitionRect")
onready var message_box: MessageBox = canvas_layer.find_node("MessageBox")

func _ready():
	#AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	Events.connect("change_scene", self, "_on_change_scene")
	
	for interaction in get_tree().get_nodes_in_group("Interaction"):
		interaction.connect("show_message", message_box, "show_message")
		interaction.connect("hide_message", message_box, "hide_message")
	
	for dialogue_component in get_tree().get_nodes_in_group("dialogue_component"):
		dialogue_component.connect("dialogue_started", self, "_on_dialogue_started")
		dialogue_component.connect("dialogue_ended", self, "_on_dialogue_ended")
		dialogue_component.connect("show_dialogue_text", self, "_on_show_dialogue_text")


func _on_change_scene(scene_path: String):
	screen_transition_rect.transition_to(scene_path)


func _on_dialogue_started() -> void:
	dettach_controls()

func _on_dialogue_ended() -> void:
	attach_controls()
	message_box.hide_message()

func _on_show_dialogue_text(speaker_name: String, text: String) -> void:
	message_box.show_message(text)


func dettach_controls():
	for character in characters.get_children():
		character.set_process_input(false)
		character.set_process(false)
		character.set_physics_process(false)


func attach_controls():
	for character in characters.get_children():
		character.set_process_input(true)
		character.set_process(true)
		character.set_physics_process(true)
