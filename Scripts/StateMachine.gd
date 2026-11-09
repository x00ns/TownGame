extends Node

@export var intial_state: Node
var actor: CharacterBody3D
var current_state: Node
var states: Dictionary = {}

func _ready() -> void:
	await owner.ready
	actor = owner
	
	for child in get_children(true):
		if child.has_method("physics_update"):
			states[child.name.to_lower()] = child
			child.actor = actor
			# connect signal
			if child.has_signal("update_state"):
				child.update_state.connect(on_state_update)
				
	if intial_state:
		current_state = intial_state
		if current_state.has_method("enter"):
			current_state.enter()

func update(delta: float) -> void:
	if current_state and current_state.has_method("physics_update"):
		current_state.physics_update(delta)

func on_state_update(state_name: String) -> void:
	var new_state = states.get(state_name.to_lower())
	
	if not new_state or new_state == current_state: return
	
	if current_state and current_state.has_method("exit"):
		current_state.exit()
	
	current_state = new_state
	
	if current_state and current_state.has_method("enter"):
		current_state.enter()
