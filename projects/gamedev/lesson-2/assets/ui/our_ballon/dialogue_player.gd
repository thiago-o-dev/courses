extends CanvasLayer
@export_file("*.json") var scene_text_file : String

@export var balloon : Control
@export var name_label : RichTextLabel
@export var text_label : RichTextLabel

var scene_text : Dictionary = {}
var selected_text := []
var in_progress : bool = false
var selected_key := ""

func _ready():
	balloon.visible = false
	scene_text = load_scene_text()
	SignalBus.display_dialogue.connect(_on_display_dialogue)
	
	#SignalBus.request_dialogue("Trem Coisado")

func _input(event):
	if !in_progress:
		return
	
	get_viewport().set_input_as_handled()
	# Isso fala para não rodar _unhandled_input() pois o input está handled
	
	if Input.is_action_just_released("interact"):
		SignalBus.request_dialogue(selected_key)
		# Chamamos o próximo dialogo da key selecionada, se for a ultima, finalizamos.
	
	if Input.is_key_pressed(KEY_0):
		SignalBus.request_dialogue("Mineirinho")

func _on_display_dialogue(text_key : String):
	if in_progress and text_key == selected_key:
		next_line()
	else:
		# Fazemos nosso balão apareccer, e colocamos a key como selecionada, entre outros.
		# Isso é a configuração do nosso "ambiente".
		set_text_enviroment(true, text_key)
		selected_text = scene_text[text_key].duplicate()
		show_text()

func next_line():
	if selected_text.size() <= 0:
		finish()
		return

	show_text()

func show_text():
	text_label.text = selected_text.pop_front()
	
func finish():
	set_text_enviroment(false)
	text_label.text = ""
	SignalBus.dialogue_ended.emit()

# isso faz ser stateful!
func set_text_enviroment(state : bool, dialogue_name : String = "Name"):
	in_progress = state
	balloon.visible = state
	name_label.text = dialogue_name.capitalize()
	selected_key = dialogue_name
	get_viewport().set_input_as_handled()

func load_scene_text() -> Dictionary:
	if not FileAccess.file_exists(scene_text_file):
		push_warning("Missing file: " + scene_text_file)
		return {}
		
	var file := FileAccess.open(scene_text_file, FileAccess.READ)
	var parsed = JSON.parse_string(file.get_as_text())

	if typeof(parsed) != TYPE_DICTIONARY:
		push_warning("Invalid JSON format.")
		return {}
		
	return parsed
