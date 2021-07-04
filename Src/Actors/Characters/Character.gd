class_name Character extends TopDownCharacter


func _physics_process(delta):
	var direction = get_input_direction()
	move(direction, delta)
	animate(direction)


func get_input_direction() -> Vector2:
	return Vector2.ZERO


func animate(direction: Vector2):
	pass
