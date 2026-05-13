extends AnimatedState

var player_body : PlayerBody

@export var idle_state : State
@export var walk_state : State
@export var speed : float = 150

func process_physics(delta: float) -> State:
	var direction = ActionComponent.get_movement_input()
	
	if direction == Vector2.ZERO:
		return idle_state
	
	animator_component.update_direction(direction)
	
	if !Input.is_key_pressed(KEY_SHIFT):
		return walk_state
	
	player_body.velocity = ActionComponent.calculate_movement_velocity(player_body, direction * speed, delta)
	
	player_body.move_and_slide()
	return
