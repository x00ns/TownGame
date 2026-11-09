extends Node
class_name CharacterState
# update state signal
signal update_state(state_name: String)
# actor link
var actor: CharacterBody3D

func enter() -> void:
	pass

func exit() -> void:
	pass

func physics_update(_delta: float) -> void:
	pass
