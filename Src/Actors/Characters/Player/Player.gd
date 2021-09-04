class_name Player extends Character


onready var interaction_ray_cast = $InteractionRayCast


func _input(event):
	if event.is_action_pressed("interact"):
		interaction_ray_cast.interact()


func physics_process(delta):
	var direction = get_input_direction()
	move(direction, delta)
	animate(direction)
	interaction_ray_cast.set_direction(direction)


func get_input_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
