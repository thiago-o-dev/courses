extends Node

# Esse arquivo está adicionado a lista de autoloads/globais em:
# Project -> Project Settings -> Globals

# Por causa disso, não definimos ele como uma classe. Ele é uma instancia unica.

signal diplay_dialogue(dialogue_key : String)

func request_dialogue(dialogue_key : String):
	diplay_dialogue.emit(diplay_dialogue, dialogue_key)
