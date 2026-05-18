extends Node

signal updated_ease(i : int)
signal updated_trans(i : int)

func update_ease(i : int):
	updated_ease.emit(i)

func update_trans(i : int):
	updated_trans.emit(i)
