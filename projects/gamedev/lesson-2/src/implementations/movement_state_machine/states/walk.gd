extends AnimatedState

var player_body : PlayerBody

@export var idle_state : State
@export var run_state : State
@export var speed : float = 100

func _enter() -> State:
	SignalBus.display_dialogue.connect(_on_display_dialogue)
	return

func _exit() -> void:
	SignalBus.display_dialogue.disconnect(_on_display_dialogue)

func _on_display_dialogue(_text_key : String):
	request_state.emit(idle_state)

func process_physics(delta: float) -> State:
	var direction = ActionComponent.get_movement_input()
	
	if direction == Vector2.ZERO:
		return idle_state
	
	animator_component.update_direction(direction)
	
	if Input.is_key_pressed(KEY_SHIFT):
		return run_state
	
	player_body.velocity = ActionComponent.calculate_movement_velocity(player_body, direction * speed, delta)
	
	player_body.move_and_slide()
	return
