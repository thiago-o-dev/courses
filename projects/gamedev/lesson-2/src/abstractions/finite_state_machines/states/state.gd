class_name State extends Node
@warning_ignore_start("redundant_await")
@warning_ignore_start("unused_signal")

var state_machine : FiniteStateMachine

signal request_state(state : State)
var dependencies_injected : bool

func on_injected_dependencies():
	dependencies_injected = true
	_on_injected_dependencies()

func _on_injected_dependencies():
	pass

## Implements constant enter functionalities. Only overwrite if you know what you are doing.
## To add single state functionalities, use on_enter() instead of this parent function.
func enter() -> State:
	return await _enter()

func _enter() -> State:
	return null

## Implements constant exit functionalities. Only overwrite if you know what you are doing.
## To add single state functionalities, use on_exit() instead of this parent function
func exit() -> void:
	# TODO: Implement all signals disconnect.
	_exit()

func _exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_unhandled_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null
	
func process_physics(_delta: float) -> State:
	return null
