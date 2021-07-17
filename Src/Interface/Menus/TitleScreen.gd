class_name TitleScreen extends Menu

var transitioning: bool = false

onready var screen_transition_rect: ScreenTransitionRect = get_node("ScreenTransitionRect")
onready var select_sound: AudioStreamPlayer = get_node("SelectSound")


func _input(event):
	if Input.is_action_just_pressed("enter") and not transitioning:
		transitioning = true
		select_sound.play()
		screen_transition_rect.transition_to(Globals.MAP_PATH + "MapTest.tscn")
