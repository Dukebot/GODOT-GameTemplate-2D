class_name MapTeleporter extends Area2D

const MAP_PATH = "res://Src/Map/Maps/"

export var map_name := ""
export var position_name := ""

onready var collision = $CollisionShape2D

func _on_MapTeleporter_body_entered(player):
	Events.emit_signal("change_scene", MAP_PATH + map_name + ".tscn")
