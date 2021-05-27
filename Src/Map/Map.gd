class_name Map extends Node2D

onready var characters = find_node("Characters") as YSort
onready var screen_transition_rect = find_node("ScreenTransitionRect") as ColorRect

func _ready():
	#AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	Events.connect("change_scene", self, "_on_change_scene")
	Events.connect("dettach_controls", self, "_on_dettach_controls")
	Events.connect("attach_controls", self, "_on_attach_controls")


func _on_change_scene(scene_path: String):
	screen_transition_rect.transition_to(scene_path)


func _on_dettach_controls():
	for character in characters.get_children():
		character.set_physics_process(false)


func _on_attach_controls():
	for character in characters.get_children():
		character.set_physics_process(true)
