extends Map

onready var dialogue = get_node("DialogueComponent")


func _ready():
	dialogue.start_dialogue()
