extends Area2D
class_name InteractableComponent

@export var interact_tooltip_packed_scene : PackedScene = preload("res://assets/ui/InteractTooltip.tscn")
var interact_tooltip_instance : Control
var player_body : PlayerBody

signal interacted(body : PlayerBody)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("ui_accept"):
		interacted.emit(player_body)

func _ready():
	instantiate_tooltip()
	
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)
	interacted.connect(on_interacted)

func on_body_entered(body : PlayerBody):
	print("body entered by player")
	player_body = body
	show_tooltip()

func on_body_exited(body : PlayerBody):
	print("body exited by player")
	player_body = null
	hide_tooltip()

func instantiate_tooltip():
	if interact_tooltip_packed_scene.can_instantiate():
		interact_tooltip_instance = interact_tooltip_packed_scene.instantiate()
		add_child(interact_tooltip_instance)
		interact_tooltip_instance.hide()

func show_tooltip():
	if !interact_tooltip_instance:
		return
	
	interact_tooltip_instance.show()

func hide_tooltip():
	if !interact_tooltip_instance:
		return
	
	interact_tooltip_instance.hide()

func on_interacted(body : PlayerBody):
	return
