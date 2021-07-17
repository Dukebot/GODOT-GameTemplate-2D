extends Node

#Format numbers
func format_float(value: float) -> float: 
	return stepify(value, 0.01)


#Get random array index
func get_random_index(array: Array) -> int:
	var rand_index : int = randi() % array.size()
	return rand_index


#Get random direction vector
func get_random_direction() -> Vector2:
	return Vector2.RIGHT.rotated(deg2rad(rand_range(0, 360)))


#Lists
func shuffleList(list: Array) -> Array:
	var shuffledList = [] 
	var indexList = range(list.size())
	for _i in range(list.size()):
		var x = randi() % indexList.size()
		shuffledList.append( list[indexList[x]] )
		indexList.remove(x)
	return shuffledList


#Collision
func restart_collision_shape(collision_shape: CollisionShape2D) -> void:
	collision_shape.set_deferred("disabled", true)
	yield(get_tree().create_timer(0.01, false), "timeout")
	#We have to check in case collision_shape has changed to null
	if collision_shape: collision_shape.set_deferred("disabled", false)


#Probablility weight arrays
static func get_random_weight_index(weight_array: Array):
	var total_weight: float = get_total_weight(weight_array)
	var rand_weight: float = rand_range(0, total_weight)
	var accumulated_weight: float = 0
	
	for i in weight_array.size():
		var weight = weight_array[i]
		accumulated_weight += weight
		if rand_weight < accumulated_weight:
			return i

static func get_total_weight(weight_array: Array) -> float:
	var total := 0.0
	for i in weight_array.size():
		total += weight_array[i]
	return total


#JSON
static func get_json_result(json_path: String):
	var file = File.new()
	file.open(json_path, file.READ)
	var json_string = file.get_as_text()
	var json_result = JSON.parse(json_string).result
	file.close()
	return json_result
