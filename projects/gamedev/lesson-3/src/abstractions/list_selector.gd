@abstract
extends Control
class_name ListSelector

@export_category("Nodes")
@export var item_list : ItemList
@export var select_label : Label
@export var select_button : Button

@export_category("Configurations")
@export var options : PackedStringArray

var selected_index = 0

var showing_options : bool = false

@abstract func set_options()

func _ready():
	set_options()
	select_label.text = options[selected_index]
	_load_options()
	_set_views()
	item_list.item_selected.connect(_on_item_selected)
	item_list.mouse_exited.connect(_switch_views_on_mouse_exited)
	select_button.pressed.connect(_switch_views)

func _load_options():
	item_list.clear()
	for option in options:
		item_list.add_item(option)
	item_list.select(selected_index)
	item_list.set_item_selectable(selected_index, false)

func _on_item_selected(index : int):
	item_list.set_item_selectable(selected_index, true)
	selected_index = index
	item_list.set_item_selectable(selected_index, false)
	select_label.text = options[index]
	
	_switch_views()

#var timer : Timer
func _switch_views_on_mouse_exited():
	if !showing_options:
		return
	
	_switch_views()

func _switch_views():
	showing_options = !showing_options
	_set_views()

func _set_views():
	item_list.visible = showing_options
	select_button.visible = !showing_options
