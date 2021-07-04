class_name ScreenTransitionRect extends ColorRect

# Reference to the _AnimationPlayer_ node
onready var _anim_player := $AnimationPlayer


func _ready() -> void:
	visible = true
	self.modulate.a = 1
	# Plays the animation backward to fade in
	_anim_player.play_backwards("fade")


func transition_to(_next_scene) -> void:
	get_tree().paused = true
	# Plays the Fade animation and wait until it finishes
	_anim_player.play("fade")
	yield(_anim_player, "animation_finished")
	get_tree().paused = false
	# Changes the scene
	get_tree().change_scene(_next_scene)
	
