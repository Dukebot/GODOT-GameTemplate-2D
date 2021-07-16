class_name MapLoader extends Node

signal load_map(map_path)

export var map_name := ""

func _ready():
	add_to_group("map_loader")

func load_map(_map_name: String = "") -> void:
	if _map_name != "":
		map_name = _map_name
	emit_signal("load_map", Globals.MAP_PATH + map_name + ".tscn")
