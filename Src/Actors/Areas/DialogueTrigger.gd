extends Area2D

onready var dialogue_component: DialogueComponent = get_node("DialogueComponent")


func _ready():
	assert(dialogue_component != null and dialogue_component is DialogueComponent)
	dialogue_component.connect("dialogue_ended", self, "_on_dialogue_component_dialogue_ended")


func _on_DialogueTrigger_body_entered(body):
	dialogue_component.start_dialogue()


func _on_dialogue_component_dialogue_ended():
	queue_free()
