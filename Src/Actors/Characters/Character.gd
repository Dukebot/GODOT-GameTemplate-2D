class_name Character extends TopDownCharacter


func _physics_process(delta):
	physics_process(delta)

func physics_process(delta: float):
	var direction = get_input_direction()
	move(direction, delta)
	animate(direction)

func get_input_direction() -> Vector2:
	return Vector2.ZERO

func animate(direction: Vector2):
	pass

func set_controls_attached(value: bool):
	set_process_input(value)
	set_process(value)
	set_physics_process(value)
