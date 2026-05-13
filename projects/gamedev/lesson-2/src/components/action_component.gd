extends Node
class_name ActionComponent

static func calculate_movement_velocity(
		player_body : PlayerBody, desired_velocity : Vector2, delta : float
	) -> Vector2:
	return player_body.velocity.move_toward(desired_velocity, delta * player_body.ACCELERATION)

static func get_movement_input() -> Vector2:
	var direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")).normalized()
	return direction
