extends ListSelector

@export var ball_animator : BallAnimator

func set_options():
	options = ClassDB.class_get_enum_constants("Tween", "EaseType")
	print(options)

func update_on_item_selected():
	SignalBus.update_ease(selected_index)
