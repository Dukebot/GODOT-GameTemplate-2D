class_name InteractionDetector extends Area2D

var interaction_area: InteractionArea


func _on_InteractionDetector_area_entered(area):
	if interaction_area == null:
		interaction_area = area
		interaction_area.detected()

func _on_InteractionDetector_area_exited(area):
	if interaction_area == area:
		interaction_area.undetected()
		interaction_area = null

func interact():
	if interaction_area:
		interaction_area.interact(owner)
