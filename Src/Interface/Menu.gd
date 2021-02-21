class_name Menu
extends Control

onready var bg_music = $BackgroundMusic

func _ready():
	if bg_music.stream:
		bg_music.play()
