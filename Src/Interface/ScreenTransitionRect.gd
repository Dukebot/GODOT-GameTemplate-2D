class_name ScreenTransitionRect extends ColorRect

# Reference to the _AnimationPlayer_ node
onready var anim_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	visible = true
	self.modulate.a = 1
	# Plays the animation backward to fade in
	anim_player.play_backwards("fade")


func transition_to(next_scene: String) -> void:
	# Plays the Fade animation and wait until it finishes
	anim_player.play("fade")
	yield(anim_player, "animation_finished")
	# Changes the scene
	get_tree().change_scene(next_scene)
