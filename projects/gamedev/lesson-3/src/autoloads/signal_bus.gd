extends Node

signal updated_ease(i : int)
signal updated_trans(i : int)
signal updated_progress(percent : float)

func update_ease(i : int):
	updated_ease.emit(i)

func update_trans(i : int):
	updated_trans.emit(i)

func update_progress(percent : float):
	updated_progress.emit(percent)
