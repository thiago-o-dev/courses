extends AnimatedSprite2D
class_name AnimatorComponent

@export var active_animation : StringName = &"default"
@export var latest_direction : Vector2 = Vector2.RIGHT

func update_animation(animation_name : StringName) -> void:
	if active_animation != animation_name:
		active_animation = animation_name
		#print("active animation: ", active_animation)
		animation_draw()

func update_direction(direction : Vector2):
	if direction != Vector2.ZERO and direction != latest_direction:
		latest_direction = direction
		direction_draw()

func animation_draw():
	animation = active_animation

func direction_draw():
	if latest_direction.x != 0.0:
		flip_h = latest_direction.x < 0
