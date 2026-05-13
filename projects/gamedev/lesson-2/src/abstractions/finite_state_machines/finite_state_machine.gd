class_name FiniteStateMachine extends Node

@warning_ignore_start("redundant_await")

@export_category("Controls")
@export var starting_state: State

@export_category("Debug Information")
@export var is_debug : bool = true
@export var current_state: State
var previous_state : State = null
# func inject_dependencies(...args : Array) -> void

func start() -> void:
	change_state(starting_state)
	return

func _ready():
	for child in get_children():
		if child is State:
			child.request_state.connect(_on_requested_state)
	
	await get_parent().ready
	start()

func _on_requested_state(new_state : State):
	change_state(new_state)

func inject_dependencies(dependencies: Dictionary):
	print("updating dependencies for ", owner.name)
	var animator_component = dependencies.get("animator_component")
	for child : State in get_children():
		child.state_machine = self
		
		if child.get_script() == State:
			push_warning("(" + name + ") " + child.name + " is base State and not implemented yet")
			continue
		
		if child is AnimatedState:
			if animator_component:
				child.animator_component = animator_component
			elif !child.animator_component:
				push_error("(" + name + ") " + child.name + " animated state requires an animator component in the first injection")
		
		if child.get_script() == AnimatedState:
			push_warning("(" + name + ") " + child.name + " is base AnimatedState and not implemented yet")
			continue
		
		for key in dependencies.keys():
			if key in child:
				child.set(key, dependencies[key])
			else:
				push_warning("(" + name + ") " + child.name + " state should have reference to '" + key + "'")
		
		child.on_injected_dependencies()

func change_state(new_state: State) -> void:
	if current_state:
		await current_state.exit()
		previous_state = current_state
	
	current_state = new_state
	debug(owner.name," (", name ,")",  ": ", current_state.name)
	var newer_state = await current_state.enter()
	if newer_state:
		change_state(newer_state)

func enter_previous():
	change_state(previous_state)

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_unhandled_input(event: InputEvent) -> void:
	var new_state = current_state.process_unhandled_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
		
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func debug(...args):
	if is_debug:
		print("".join(args))
