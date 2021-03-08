class_name Character
extends TopDownCharacter

onready var sprite: Sprite = $Sprite
onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var animation_tree: AnimationTree = $AnimationTree
onready var animation_state: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]


func _physics_process(delta):
	var direction = get_input_direction()
	move(direction, delta)
	animate(direction)

func get_input_direction() -> Vector2:
	return Vector2.ZERO

func animate(direction: Vector2):
	if direction != Vector2.ZERO:
		animation_tree["parameters/" + animation_state.get_current_node() + "/blend_position"] = direction
		animation_state.travel("Move")
	else:
		animation_state.travel("Idle")
