class_name MapLoader extends Node

signal load_map(map_path, position_name, facing_direction)

export var map_name := ""
export var position_name := ""
export var facing_direction := Vector2.ZERO


func _ready():
	add_to_group("map_loader")


func load_map(_map_name := "", _position_name := "", _facing_direction := Vector2.ZERO) -> void:
	if _map_name != "": map_name = _map_name
	if _position_name != "": position_name = _position_name
	if _facing_direction != Vector2.ZERO: facing_direction = _facing_direction
	
	emit_signal("load_map", Globals.MAP_PATH + map_name + ".tscn", position_name, facing_direction)
