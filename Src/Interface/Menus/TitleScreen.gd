class_name TitleScreen extends Menu


func _input(event):
	if Input.is_action_just_pressed("enter"):
		$ScreenTransitionRect.transition_to(Globals.MAP_PATH + "MapTest.tscn")
