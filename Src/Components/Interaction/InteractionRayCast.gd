class_name InteractionRayCast extends RayCast2D

var interaction_area: InteractionArea


func _process(delta):
	var collider = get_collider()
	if not interaction_area:
		if collider:
			interaction_area = collider
			interaction_area.detected()
	else:
		if not collider:
			interaction_area.undetected()
			interaction_area = null
		elif collider != interaction_area:
			interaction_area.undetected()
			interaction_area = collider


func interact():
	if interaction_area:
		interaction_area.interact(owner)
	else:
		print("Nothing to interact...")


func set_direction(direction: Vector2):
	if direction != Vector2.ZERO:
		cast_to = direction * 10
