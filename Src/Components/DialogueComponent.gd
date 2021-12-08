class_name DialogueComponent extends Node

signal dialogue_started
signal dialogue_ended
signal show_dialogue_text(speaker_name, text)
signal end_text_animation

export (String) var dialogue_file_name = "dialogues.json"
export (String) var dialogue_id = "test"

var dialogue_data: Array
var dialogue_running: bool = false
var dialogue_text_animating: bool = false
var current_dialogue_index: int = 0


func _ready():
	add_to_group("dialogue_component")
	set_process_input(false)
	load_dialogue(dialogue_id)


func _input(event):
	if event.is_action_pressed("interact"):
		if not dialogue_text_animating:
			if current_dialogue_index == dialogue_data.size():
				end_dialogue()
			else:
				show_dialogue_text()
				dialogue_text_animating = true
		else:
			emit_signal("end_text_animation")


func _on_text_animation_ended():
	dialogue_text_animating = false


func load_dialogue(_dialogue_id: String):
	dialogue_id = _dialogue_id
	var dialogue_file_path = Globals.JSON_PATH + "Dialogue/" + dialogue_file_name
	var json_result = Utils.get_json_result(dialogue_file_path)
	dialogue_data = json_result[dialogue_id]


func start_dialogue():
	if not dialogue_running:
		dialogue_running = true
		emit_signal("dialogue_started")
		show_dialogue_text()
		dialogue_text_animating = true
		set_process_input(true)


func end_dialogue():
	dialogue_running = false
	current_dialogue_index = 0
	emit_signal("dialogue_ended")
	set_process_input(false)


func show_dialogue_text():
	var speaker_name = dialogue_data[current_dialogue_index][0]
	var text = dialogue_data[current_dialogue_index][1]
	emit_signal("show_dialogue_text", speaker_name, text)
	current_dialogue_index += 1
