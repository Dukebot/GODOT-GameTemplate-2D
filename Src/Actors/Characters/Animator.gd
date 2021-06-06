class_name Animator extends AnimatedSprite


var animation_name: String = "idle"
var animation_direction: String = "down"


func _ready():
	speed_scale = 0.75
	play(animation_name + "_" + animation_direction)


func movement_animation_vector(direction: Vector2):
	update_animation_name(direction)
	update_animation_direction(direction)
	play(animation_name + "_" + animation_direction)


func update_animation_name(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		animation_name = "idle"
	else:
		animation_name = "move"


func update_animation_direction(direction: Vector2) -> void:
	if direction.x != 0 and direction.y == 0:
		if direction.x > 0:
			animation_direction = "right"
		else:
			animation_direction = "left"
	
	if direction.y != 0:
		if direction.y > 0:
			animation_direction = "down"
		elif direction.y < 0:
			animation_direction = "up"
	

