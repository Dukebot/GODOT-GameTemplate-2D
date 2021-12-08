class_name Map extends Node2D

onready var y_sort: YSort = get_node("YSort")
onready var characters: YSort = y_sort.get_node("Characters")
onready var static_bodies: YSort = y_sort.get_node("StaticBodies")

onready var player: Player = characters.get_node("Player")

onready var canvas_layer: CanvasLayer = get_node("CanvasLayer")
onready var screen_transition_rect: ScreenTransitionRect = canvas_layer.find_node("ScreenTransitionRect")
onready var message_box: MessageBox = canvas_layer.find_node("MessageBox")


func _ready():
	#AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	
	for map_loader in get_tree().get_nodes_in_group("map_loader"):
		map_loader.connect("load_map", self, "load_map")
	
	for dialogue_component in get_tree().get_nodes_in_group("dialogue_component"):
		dialogue_component.connect("dialogue_started", self, "dettach_controls")
		dialogue_component.connect("dialogue_ended", self, "attach_controls")
	
	set_player_position()


func load_map(scene_path: String, position_name: String, facing_direction: Vector2):
	Globals.position_name = position_name
	Globals.facing_direction = facing_direction
	screen_transition_rect.transition_to(scene_path)


func dettach_controls():
	for character in characters.get_children():
		character.set_controls_attached(false)

func attach_controls():
	for character in characters.get_children():
		character.set_controls_attached(true)


func set_player_position():
	var position_node = find_node(Globals.position_name)
	if position_node: player.position = position_node.position
	player.animate(Globals.facing_direction)
