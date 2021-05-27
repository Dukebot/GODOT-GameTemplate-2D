class_name DialogueComponent extends Node

signal dialogue_started
signal dialogue_ended
signal show_dialogue_text(speaker_name, text)

const JSON_DIALOGUE_PATH = "res://Json/Dialogue/"

export (String) var dialogue_file_name
export (String) var dialogue_id

var dialogue_data: Array
var dialogue_running: bool = false
var current_dialogue_index: int = 0


func _ready():
	load_dialogue()


func load_dialogue():
	var path = JSON_DIALOGUE_PATH + dialogue_file_name + ".json"
	var json_result = Utils.get_json_result(path)
	dialogue_data = json_result[dialogue_id]


func interact():
	if not dialogue_running:
		start_dialogue()
	else:
		if current_dialogue_index == dialogue_data.size():
			end_dialogue()
		else:
			show_dialogue_text()


func start_dialogue():
	if not dialogue_running:
		dialogue_running = true
		Events.emit_signal("dettach_controls")
		emit_signal("dialogue_started")


func end_dialogue():
	Events.emit_signal("attach_controls")
	emit_signal("dialogue_ended")
	dialogue_running = false
	current_dialogue_index = 0


func show_dialogue_text():
	var speaker_name = dialogue_data[current_dialogue_index][0]
	var text = dialogue_data[current_dialogue_index][1]
	emit_signal("show_dialogue_text", speaker_name, text)
	current_dialogue_index += 1

