extends CharacterBody2D

const SPEED : float = 128.0
const ACCELERATION : float = 8

@export var animated_sprite_2d : AnimatedSprite2D

func _physics_process(delta):
	var direction = get_movement_input()
	
	var desired_velocity = direction * SPEED
	
	velocity = velocity.move_toward(desired_velocity, delta * SPEED * ACCELERATION) 

	move_and_slide()
	if velocity != Vector2.ZERO:
		animated_sprite_2d.animation = &"jog"
		animated_sprite_2d.flip_h = velocity.x < 0
	else:
		animated_sprite_2d.animation = &"default"

func get_movement_input() -> Vector2:
	var direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")).normalized()
	#print(direction)
	return direction
