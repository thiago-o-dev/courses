extends AnimatedState

var player_body : PlayerBody

@export var walk_state : State

func process_unhandled_input(_event: InputEvent) -> State:
	var direction = ActionComponent.get_movement_input()
	
	if direction != Vector2.ZERO:
		return walk_state
	return

func process_physics(delta: float) -> State:
	player_body.velocity = ActionComponent.calculate_movement_velocity(player_body, Vector2.ZERO, delta)
	
	player_body.move_and_slide()
	return
