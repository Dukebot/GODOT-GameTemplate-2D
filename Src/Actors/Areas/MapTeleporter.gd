class_name MapTeleporter extends Area2D

onready var map_loader: MapLoader = get_node("MapLoader")
onready var collision: CollisionShape2D = get_node("CollisionShape2D")


func _on_MapTeleporter_body_entered(player):
	map_loader.load_map()


func set_enabled(value: bool) -> void:
	collision.set_deferred("disabled", not value)
