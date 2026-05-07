extends CharacterBody2D
class_name PlayerBody

const SPEED : float = 100.0
const RUN_MULTIPLIER : float = 1.5
const ACCELERATION : float = 4

const SPEED_LENGTH_SQR = (SPEED) ** 2

var is_running : bool = false
@export var animated_sprite_2d : AnimatedSprite2D

func _physics_process(delta):
	is_running = false
	var direction = get_movement_input()
	
	var desired_velocity = direction * SPEED
	
	if Input.is_key_pressed(KEY_SHIFT):
		desired_velocity *= RUN_MULTIPLIER
		is_running = true
	
	velocity = velocity.move_toward(desired_velocity, delta * SPEED * ACCELERATION) 

	move_and_slide()
	if velocity != Vector2.ZERO:
		#if is_running:
		if velocity.length_squared() > SPEED_LENGTH_SQR:
			animated_sprite_2d.animation = &"run"
		else:
			animated_sprite_2d.animation = &"jog"
		
		if desired_velocity.x != 0:
			animated_sprite_2d.flip_h = desired_velocity.x < 0
	else:
		animated_sprite_2d.animation = &"default"

func get_movement_input() -> Vector2:
	var direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")).normalized()
	#print(direction)
	return direction
