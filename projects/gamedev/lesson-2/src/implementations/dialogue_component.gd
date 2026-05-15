extends InteractableComponent
class_name DialogueComponent

@export var dialogue_key : String = ""
@export var talkable : bool = true

func on_interacted(_body : PlayerBody):
	print("interacted with dialogue area of key " + dialogue_key)
	
	SignalBus.request_dialogue(dialogue_key)
