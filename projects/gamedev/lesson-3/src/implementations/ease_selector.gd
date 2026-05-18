extends ListSelector

func set_options():
	options = ClassDB.class_get_enum_constants("Tween", "EaseType")
	print(options)
