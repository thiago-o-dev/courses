extends Control

@export var item_list : ItemList
@export var options : Array[Tween.TransitionType]

var selected_index = 0

func _ready():
	for option in options:
		item_list.add_item(str(option))
	
	item_list.item_selected.connect(_on_item_selected)

func _on_item_selected(index : int):
	item_list.set_item_selectable(selected_index, true)
	selected_index = index
	item_list.set_item_selectable(selected_index, false)
