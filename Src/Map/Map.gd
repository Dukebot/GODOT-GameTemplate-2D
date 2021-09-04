class_name Map extends Node2D

onready var y_sort: YSort = get_node("YSort")
onready var characters: YSort = y_sort.get_node("Characters")
onready var static_bodies: YSort = y_sort.get_node("StaticBodies")

onready var canvas_layer: CanvasLayer = get_node("CanvasLayer")
onready var screen_transition_rect: ScreenTransitionRect = canvas_layer.find_node("ScreenTransitionRect")
onready var message_box: MessageBox = canvas_layer.find_node("MessageBox")


func _ready():
	#AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	
	for map_loader in get_tree().get_nodes_in_group("map_loader"):
		map_loader.connect("load_map", self, "_on_load_map")
	
	for dialogue_component in get_tree().get_nodes_in_group("dialogue_component"):
		dialogue_component.connect("dialogue_started", self, "_on_dialogue_started")
		dialogue_component.connect("dialogue_ended", self, "_on_dialogue_ended")


func _on_load_map(scene_path: String):
	screen_transition_rect.transition_to(scene_path)


func _on_dialogue_started() -> void:
	dettach_controls()

func _on_dialogue_ended() -> void:
	attach_controls()
	message_box.hide_message()


func dettach_controls():
	for character in characters.get_children():
		character.set_controls_attached(false)

func attach_controls():
	for character in characters.get_children():
		character.set_controls_attached(true)
