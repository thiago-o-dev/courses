class_name AnimatedState extends State

@export var animation_name : StringName = &"default"

var animator_component : AnimatorComponent

func enter() -> State:
	animator_component.update_animation(animation_name)
	return _enter()
