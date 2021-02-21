class_name Player
extends Character

onready var sprite: Sprite = $Sprite
onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var animation_tree: AnimationTree = $AnimationTree
onready var animation_state: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]

func _physics_process(delta):
	var direction = get_input_direction()
	move(direction, delta)
	animate(direction)

func get_input_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()

func animate(direction: Vector2):
	if direction != Vector2.ZERO:
		animation_tree["parameters/" + animation_state.get_current_node() + "/blend_position"] = direction
		animation_state.travel("Move")
	else:
		animation_state.travel("Idle")
