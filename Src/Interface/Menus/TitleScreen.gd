class_name TitleScreen extends Menu

onready var screen_transition_rect = get_node("ScreenTransitionRect")


func _input(event):
	if Input.is_action_just_pressed("enter"):
		screen_transition_rect.transition_to(Globals.MAP_PATH + "MapTest.tscn")
