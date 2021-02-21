class_name TitleScreen
extends Menu

func _input(event):
	if Input.is_action_just_pressed("enter"):
		get_tree().change_scene("res://Src/Maps/MapTemplate.tscn")
