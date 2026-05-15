extends Node

# Esse arquivo está adicionado a lista de autoloads/globais em:
# Project -> Project Settings -> Globals

# Por causa disso, não definimos ele como uma classe. Ele é uma instancia unica.

signal display_dialogue(dialogue_key : String)
signal dialogue_ended

func request_dialogue(dialogue_key : String):
	display_dialogue.emit(dialogue_key)
