extends CharacterBody2D
class_name PlayerBody

const ACCELERATION : float = 400

@export var movement_state_machine : FiniteStateMachine
@export var animator_component : AnimatorComponent

func _ready():
	movement_state_machine.inject_dependencies({
		"animator_component" : animator_component,
		"player_body" : self
	})

func _physics_process(delta):
	movement_state_machine.process_physics(delta)

func _unhandled_input(event):
	movement_state_machine.process_unhandled_input(event)
